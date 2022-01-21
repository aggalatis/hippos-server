const { default: axios } = require('axios')
const express = require('express')
const _ = require('underscore')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const server = require('../utils/server')
const router = express.Router()

router.post('/', async (req, res) => {
    const customerData = req.body.customerData
    let foundCustomer = await db.query('Select customer_id FROM customers WHERE customer_vat_number = ?', [customerData.customer_vat_number])
    if (foundCustomer.length != 0) {
        res.send({ status: 500, data: 'Αδυναμία καταχώρησης πελάτη, ο πελάτης είναι ήδη καταχωρημένος.' })
        return
    }
    const newCustomer = await db.query(
        'INSERT INTO customers ' +
            '(customer_fullname, customer_phone, customer_branch, customer_address, customer_address_number, customer_area, customer_vat_number, customer_tax_office, customer_postal_code, customer_bussiness, customer_load, customer_destination, customer_date_created) ' +
            'VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)',
        [
            customerData.customer_fullname,
            customerData.customer_phone,
            customerData.customer_branch,
            customerData.customer_address,
            customerData.customer_address_number,
            customerData.customer_area,
            customerData.customer_vat_number,
            customerData.customer_tax_office,
            customerData.customer_postal_code,
            customerData.customer_bussiness,
            customerData.customer_load,
            customerData.customer_destination,
            helpers.getDateTimeNowMysql(),
        ]
    )
    if (_.isUndefined(newCustomer.insertId)) {
        res.send({ status: 500, data: 'Αδυναμία καταχώρησης πελάτη.' })
        return
    }
    res.send({ status: 200, data: 'Επιτυχής καταχώρηση πελάτη.' })
})

router.get('/all', async (req, res) => {
    const customers = await db.query('SELECT * FROM customers', [])
    if (_.isEmpty(customers)) {
        res.send({ status: 500, data: [] })
        return
    }
    res.send({ status: 200, data: customers })
})

router.get('/searchVat/:vat', async (req, res) => {
    const customerVat = req.params.vat
    const token = await server.validateRocketaxToken()
    const headers = {
        Authorization: token,
    }
    axios
        .get(`${global.parameters.server.remoteUrl}Goverment/Search/${customerVat}`, { headers: headers })
        .then(response => {
            if (response.status != 200) {
                res.sendStatus(500)
                return
            }
            if (response.data.status != 200) {
                res.send({
                    status: 520,
                    message: _.values(response.data.message).join(','),
                })
                return
            }
            let companyData = response.data.data
            let drastiriotia = companyData.epaggelmata.item.find(el => el.firm_act_kind_descr == 'ΚΥΡΙΑ')
            let finalData = {
                status: 200,
                data: {
                    fullName: companyData.basic.onomasia.trim(),
                    branch: 0,
                    address: companyData.basic.postal_address.trim(),
                    addressNumber: companyData.basic.postal_address_no.trim(),
                    area: companyData.basic.postal_area_description.trim(),
                    vatNumber: companyData.basic.afm.trim(),
                    taxOffice: companyData.basic.doy_descr.trim(),
                    postalCode: companyData.basic.postal_zip_code.trim(),
                    bussiness: drastiriotia.firm_act_descr.trim(),
                },
            }
            res.send(finalData)
        })
        .catch(error => {
            helpers.log(error)
            res.sendStatus(500)
        })
})

router.delete('/:id', async (req, res) => {
    const customerId = req.params.id
    const response = await db.query('DELETE FROM customers WHERE customer_id = ? LIMIT 1', [customerId])
    if (response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία διαγραφής πελάτη.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχής διαγραφή πελάτη.',
        })
    }
})

router.put('/', async (req, res) => {
    let customerData = req.body.customerData
    const response = await db.query(
        `UPDATE customers SET 
        customer_address = ?,
        customer_address_number = ?,
        customer_area = ?,
        customer_branch = ?,
        customer_bussiness = ?,
        customer_destination = ?,
        customer_fullname = ?,
        customer_load = ?,
        customer_phone = ?,
        customer_postal_code = ?,
        customer_tax_office = ?,
        customer_vat_number = ? 
        WHERE customer_id = ?`,
        [
            customerData.customer_address,
            customerData.customer_address_number,
            customerData.customer_area,
            customerData.customer_branch,
            customerData.customer_bussiness,
            customerData.customer_destination,
            customerData.customer_fullname,
            customerData.customer_load,
            customerData.customer_phone,
            customerData.customer_postal_code,
            customerData.customer_tax_office,
            customerData.customer_vat_number,
            customerData.customer_id,
        ]
    )

    if (response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία επεξεργασίας πελάτη.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχής επεξεργασία πελάτη.',
        })
    }
})
module.exports = router
