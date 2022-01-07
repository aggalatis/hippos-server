const escpos = require('escpos')
const nodeHtmlToImage = require('node-html-to-image')

escpos.Network = require('escpos-network')
escpos.USB = require('escpos-usb')

const helpers = require('./helpers')

function printSummaryReport(subject, lastCloseDate, summaries) {
    let device = null

    nodeHtmlToImage({
        output: './summary.png',
        html: preparePrintTemplate(subject, lastCloseDate, summaries),
    }).then(() => {
        if (global.parameters.summaries.printerType == 'usb') {
            device = new escpos.USB(0x01, 0xff)
        } else {
            device = new escpos.Network(global.parameters.summaries.printerConn)
        }
        const printer = new escpos.Printer(device)

        escpos.Image.load('./summary.png', function (image) {
            device.open(function () {
                printer.raster(image).cut().close()
            })
        })
        return true
    })
}

function preparePrintTemplate(subject, lastCloseDate, summaries) {
    let template = `<!DOCTYPE html>
    <style>
        body {
            width: 15cm;
            line-height: 1.3;
            font-size: 25px;
            margin: 5px;
            
        }
    
        table {
            border-spacing: 0rem;
        }
    
        table .th {
            border-bottom: black thin;
            border-bottom-style: solid;
            font-style: normal;
            padding: 0px;
        }
        
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
            margin: 0px auto;
            width: 15cm;
        }
    
        .tg td {
            padding: 4px 1px;
        }
    
        .tg th {
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
        }
    
        .tg .tg-baqh {
            text-align: center;
            vertical-align: top;
        }
    
        .tg .tg-yw4l {
            vertical-align: top;
        }
    
        .tg .tg-kjho {
            background-color: #1b1b1a;
            vertical-align: top;
            color: white;
        }
    
        .tg .tg-kjhoaa {
            background-color: #565655;
            vertical-align: top;
            color: white;
        }
    
        hr {
            color: black;
            display: block;
            margin: 1em 0;
            padding: 0;
            border: 1px solid black;
        }
        .goright {
            text-align: right;
        }
        .uline {
            text-decoration: underline;
        }
    </style>
    
    <div align="center">
        <br />
        <table class="tg">
            <tr>
                <th class="tg-baqh" colspan="7">{{summaryHeader}}</th>
            </tr>
            <tr>
                <td class="tg-yw4l" colspan="3">ΑΠΟ:</td>
                <td class="tg-yw4l goright" colspan="4">{{fromDatetime}}</td>
            </tr>
            <tr>
                <td class="tg-yw4l" colspan="3">ΕΩΣ:</td>
                <td class="tg-yw4l goright" colspan="4">{{toDatetime}}</td>
            </tr>
            <tr>
                <th class="tg-baqh" colspan="7"><hr /></th>
            </tr>
        </table>
        <br />
        {{userSummaries}}
    </div>`
    template = template.replace('{{summaryHeader}}', subject)
    template = template.replace('{{fromDatetime}}', helpers.changeMysqlDateToNormal(lastCloseDate))
    template = template.replace('{{toDatetime}}', helpers.getDateTimeNow())
    let userString = ''
    let sumCash = 0
    let sumCards = 0
    let sumDiscount = 0
    let sumCustomers = 0
    for (let userSum of summaries) {
        userString += '<table class="tg">'
        userString += '<tr>'
        userString += `<th class="tg-baqh uline" colspan="7">ΧΡΗΣΤΗΣ: ${userSum.user_name}</th>`
        userString += '</tr>'
        userString += `<tr><td class="tg-yw4l" colspan="3">ΜΕΤΡΗΤΑ:</td><td class="tg-yw4l goright" colspan="4">${userSum.cash_income_count.toFixed(
            2
        )} €</td></tr>`
        userString += `<tr><td class="tg-yw4l" colspan="3">ΚΑΡΤΕΣ:</td><td class="tg-yw4l goright" colspan="4">${userSum.card_income_count.toFixed(
            2
        )} €</td></tr>`
        userString += `<tr><td class="tg-yw4l" colspan="3">ΣΥΝΟΛΟ:</td><td class="tg-yw4l goright" colspan="4">${(
            userSum.cash_income_count + userSum.card_income_count
        ).toFixed(2)} €</td></tr>`
        userString += `<tr><td class="tg-yw4l" colspan="3">ΕΚΠΤΩΣΕΙΣ:</td><td class="tg-yw4l goright" colspan="4">${userSum.sum_discount_count.toFixed(
            2
        )} €</td></tr>`
        userString += `<tr><td class="tg-yw4l" colspan="3">ΠΑΡΑΓΓΕΛΙΕΣ:</td><td class="tg-yw4l goright" colspan="4">${userSum.sum_customer_count.toFixed(
            0
        )}</td></tr>`
        userString += '<tr><th class="tg-baqh" colspan="7"><hr /></th></tr>'
        userString += '</table>'
        sumCash = sumCash + userSum.cash_income_count
        sumCards = sumCards + userSum.card_income_count
        sumDiscount = sumDiscount + userSum.sum_discount_count
        sumCustomers = sumCustomers + userSum.sum_customer_count
    }
    userString += '<table class="tg">'
    userString += '<tr>'
    userString += `<th class="tg-baqh uline" colspan="7">ΣΥΝΟΛΟ ΟΛΩΝ ΤΩΝ ΧΡΗΣΤΩΝ</th>`
    userString += '</tr>'
    userString += `<tr><td class="tg-yw4l" colspan="3">ΜΕΤΡΗΤΑ:</td><td class="tg-yw4l goright" colspan="4">${sumCash.toFixed(2)} €</td></tr>`
    userString += `<tr><td class="tg-yw4l" colspan="3">ΚΑΡΤΕΣ:</td><td class="tg-yw4l goright" colspan="4">${sumCards.toFixed(2)} €</td></tr>`
    userString += `<tr><td class="tg-yw4l" colspan="3">ΣΥΝΟΛΟ:</td><td class="tg-yw4l goright" colspan="4">${(sumCash + sumCards).toFixed(
        2
    )} €</td></tr>`
    userString += `<tr><td class="tg-yw4l" colspan="3">ΕΚΠΤΩΣΕΙΣ:</td><td class="tg-yw4l goright" colspan="4">${sumDiscount.toFixed(2)} €</td></tr>`
    userString += `<tr><td class="tg-yw4l" colspan="3">ΠΑΡΑΓΓΕΛΙΕΣ:</td><td class="tg-yw4l goright" colspan="4">${sumCustomers.toFixed(0)}</td></tr>`
    userString += '<tr><th class="tg-baqh" colspan="7"><hr /></th></tr>'
    userString += '</table>'
    template = template.replace('{{userSummaries}}', userString)
    return template
}

module.exports = {
    printSummaryReport,
}
