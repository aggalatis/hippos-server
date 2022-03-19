let customersClass = function () {
    this.Helpers = new HelpersClass()
    this.Helpers.initSettings()
    this.Helpers.getCookie()
    this.initializeCustomersTable()
    this.bindClickEventOnButtons()
}

customersClass.prototype.initializeCustomersTable = function () {
    let self = this

    self.customersTable = $('#customers-table').DataTable({
        processing: false,
        ajax: self.Helpers.LOCAL_API + 'customers/all',
        paging: true,
        searching: true,
        ordering: false,
        bPaginate: false,
        bInfo: false,
        columns: [
            { data: 'customer_id' },
            { data: 'customer_fullname' },
            { data: 'customer_bussiness' },
            { data: 'customer_vat_number' },
            { data: 'customer_tax_office' },
            { data: 'customer_address' },
            { data: 'customer_address_number' },
            { data: 'customer_area' },
            {
                defaultContent:
                    '<div class="btn-group categories-actions" >\n' +
                    '                            <a class="btn btn-default edit-customer"><i class="fa fa-pencil"></i></a><a class="btn btn-default delete-customer" ><i class="fa fa-times"></i></a>                            \n' +
                    '                          </div>',
            },
        ],
    })

    $('#customers-table').on('click', 'a', function () {
        var data = self.customersTable.row($(this).parents('tr')).data()

        if ($(this).hasClass('delete-customer')) {
            swal(
                {
                    title: 'Διαγραφή Πελάτη?',
                    text:
                        'Είστε σίγουροι πως θέλετε να διαγράψετε τον πελάτη? Όλα τα δεδομένα του πελάτη ' +
                        data.customer_fullname +
                        ' δεν θα είναι διαθέσιμα μετά τη διαγραφή...',
                    type: 'warning',
                    showCancelButton: true,
                    cancelButtonText: 'Άκυρο',
                    confirmButtonColor: '#dc3545',
                    confirmButtonText: 'Διαγραφή',
                    closeOnConfirm: true,
                },
                function () {
                    $.ajax({
                        url: self.Helpers.LOCAL_API + 'customers/' + data.customer_id,
                        type: 'delete',
                        dataType: 'json',
                        data: '',
                        success: function (response) {
                            if (response.status === 200) {
                                self.Helpers.toastr('success', response.message)
                            } else {
                                self.Helpers.toastrServerError()
                            }

                            self.customersTable.ajax.reload()
                        },
                        error: function (jqXHR, textStatus) {
                            self.Helpers.swalServerError()
                        },
                    })
                }
            )
        } else {
            $('#customer_id').val(data.customer_id)
            $('#customer_fullname').val(data.customer_fullname)
            $('#customer_vat_number').val(data.customer_vat_number)
            $('#customer_bussiness').val(data.customer_bussiness)
            $('#customer_tax_office').val(data.customer_tax_office)
            $('#customer_phone').val(data.customer_phone)
            $('#customer_address').val(data.customer_address)
            $('#customer_address_number').val(data.customer_address_number)
            $('#customer_area').val(data.customer_area)
            $('#customer_postal_code').val(data.customer_postal_code)
            $('#customer_load').val(data.customer_load)
            $('#customer_destination').val(data.customer_destination)
            $('#customer_branch').val(data.customer_branch)
            $('#customers-modal').modal('show')
        }
    })
}

customersClass.prototype.bindClickEventOnButtons = function () {
    let self = this
    $('#save-customer').on('click', function () {
        self.submitCustomer()
    })

    $('#create-customer').on('click', function () {
        $('#customer_id').val(0)
        $('#customer_fullname').val('')
        $('#customer_branch').val(0)
        $('#customer_vat_number').val('')
        $('#customer_bussiness').val('')
        $('#customer_tax_office').val('')
        $('#customer_phone').val('')
        $('#customer_address').val('')
        $('#customer_address_number').val('')
        $('#customer_area').val('')
        $('#customer_postal_code').val('')
        $('#customer_load').val('ΕΔΡΑ ΜΑΣ')
        $('#customer_destination').val('ΕΔΡΑ ΤΟΥΣ')
        $('#customers-modal').modal('show')
    })

    $('#search-customer').on('click', function () {
        let customerAfm = $('#customer_vat_number').val()
        $.ajax({
            url: `${self.Helpers.LOCAL_API}customers/searchVat/${customerAfm}`,
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success: function (response) {
                console.log(response)
                if (response.status != 200) {
                    self.Helpers.toastr('error', response.message)
                    return
                }
                $('#customer_fullname').val(response.data.fullName)
                $('#customer_branch').val(response.data.branch)
                $('#customer_vat_number').val(response.data.vatNumber)
                $('#customer_bussiness').val(response.data.bussiness)
                $('#customer_tax_office').val(response.data.taxOffice)
                $('#customer_address').val(response.data.address)
                $('#customer_address_number').val(response.data.addressNumber)
                $('#customer_area').val(response.data.area)
                $('#customer_postal_code').val(response.data.postalCode)
                $('#customer_load').val('ΕΔΡΑ ΜΑΣ')
                $('#customer_destination').val('ΕΔΡΑ ΤΟΥΣ')
                self.Helpers.toastr('success', `Επιτυχία ανάκτησης δεδομένων από την ΑΑΔΕ!`)
            },
            error: function (jqXHR, textStatus) {
                self.Helpers.swalServerError()
                console.log(jqXHR)
            },
        })
    })
}

customersClass.prototype.submitCustomer = function () {
    let self = this

    $('#save-customerr').attr('disabled', 'disabled')
    $('#save-customerr').html('Αποθήκευση...')

    let customer_id = $('#customer_id').val()
    let customerData = {
        customerData: {
            customer_id: customer_id,
            customer_fullname: $('#customer_fullname').val(),
            customer_phone: $('#customer_phone').val(),
            customer_branch: $('#customer_branch').val(),
            customer_address: $('#customer_address').val(),
            customer_address_number: $('#customer_address_number').val(),
            customer_area: $('#customer_area').val(),
            customer_vat_number: $('#customer_vat_number').val(),
            customer_tax_office: $('#customer_tax_office').val(),
            customer_postal_code: $('#customer_postal_code').val(),
            customer_bussiness: $('#customer_bussiness').val(),
            customer_load: $('#customer_load').val(),
            customer_destination: $('#customer_destination').val(),
            customer_date_created: self.Helpers.getTodayDate(),
        },
    }
    if (customer_id == 0) {
        $.ajax({
            url: self.Helpers.LOCAL_API + 'customers',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(customerData),
            success: function (response) {
                if (response.status === 200) {
                    self.Helpers.toastr('success', response.data)
                    $('#customers-modal').modal('hide')
                } else {
                    self.Helpers.toastr('error', response.data)
                }

                self.customersTable.ajax.reload()
            },
            error: function (jqXHR, textStatus) {
                self.Helpers.swalServerError()
            },
        })
    } else {
        $.ajax({
            url: self.Helpers.LOCAL_API + 'customers',
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(customerData),
            success: function (response) {
                if (response.status === 200) {
                    self.Helpers.toastr('success', response.message)
                    $('#customers-modal').modal('hide')
                } else {
                    self.Helpers.toastrServerError()
                }

                self.customersTable.ajax.reload()
            },
            error: function (jqXHR, textStatus) {
                self.Helpers.swalServerError()
            },
        })
    }

    $('#save-user').attr('disabled', null)
    $('#save-user').html('Αποθήκευση')
}
