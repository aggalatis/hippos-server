let HelpersClass = function () {
    let self = this
    self.tokenData = null
    self.requestTimeout = 5000
    self.userSettings = {}
    self.initSettings()
    self.initActions()
    self.bindLogout()
}

HelpersClass.prototype.initSettings = function () {
    let self = this
    let domain = window.location.href
    self.LOCAL_API = domain.substr(0, domain.indexOf('hippoView')) + 'hippoApi/'
    self.LOCAL_DOMAIN = domain.substr(0, domain.indexOf('hippoView')) + 'hippoView'
    self.ADMIN_DOMAIN = self.LOCAL_DOMAIN + '/admin/'
}

HelpersClass.prototype.initActions = function () {
    let self = this
    $('.navbar-brand').on('click', function () {
        window.location.reload()
    })

    $('#load-dashboard').on('click', function () {
        window.location.replace(self.ADMIN_DOMAIN + 'dashboard')
    })

    $('#load-catalogue').on('click', function () {
        window.location.replace(self.ADMIN_DOMAIN + 'catalogue')
    })

    $('#load-users').on('click', function () {
        window.location.replace(self.ADMIN_DOMAIN + 'users')
    })

    $('#load-preferences').on('click', function () {
        window.location.replace(self.ADMIN_DOMAIN + 'preferences')
    })

    $('#load-customers').on('click', function () {
        window.location.replace(self.ADMIN_DOMAIN + 'customers')
    })
}

HelpersClass.prototype.toastr = function ($type, $message) {
    // notification popup
    toastr.options.closeButton = true
    toastr.options.positionClass = 'toast-top-right'
    toastr.options.showDuration = 1000
    toastr[$type]($message)
}

HelpersClass.prototype.toastrServerError = function () {
    // notification popup
    toastr.options.closeButton = true
    toastr.options.positionClass = 'toast-top-right'
    toastr.options.showDuration = 1000
    toastr['error']('Αποτυχία. Δοκιμάστε ξανά.')
}

HelpersClass.prototype.swalServerError = function () {
    swal({
        title: 'Αποτυχία',
        text: 'Αδυναμία επικοινωνίας με το server!',
        type: 'error',
        showCancelButton: false,
        showConfirmButton: true,
        cancelButtonText: 'Άκυρο',
        confirmButtonColor: '#d9534f',
        confirmButtonText: 'OK',
        closeOnConfirm: true,
    })
}

HelpersClass.prototype.getTodayDate = function () {
    var date = new Date()
    date =
        date.getUTCFullYear() +
        '-' +
        ('00' + (date.getUTCMonth() + 1)).slice(-2) +
        '-' +
        ('00' + date.getUTCDate()).slice(-2) +
        ' ' +
        ('00' + date.getHours()).slice(-2) +
        ':' +
        ('00' + date.getUTCMinutes()).slice(-2) +
        ':' +
        ('00' + date.getUTCSeconds()).slice(-2)

    return date
}

HelpersClass.prototype.bindLogout = function () {
    let self = this

    $('.logout').on('click', function () {
        let userData = {
            userData: {
                user_id: self.userData.user_id,
            },
        }
        $.ajax({
            contentType: 'application/json',
            url: self.LOCAL_API + 'users/authenticate/logout',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(userData),
            success: function (response) {
                if (response.status === 200) {
                    $(this).unbind().on('click')
                    Cookies.remove('hippos-cookie')
                    window.location.replace(self.LOCAL_DOMAIN + '/login')
                } else {
                    self.toastrServerError()
                }
            },
            error: function (jqXHR, textStatus) {
                self.swalServerError()
                console.log(jqXHR, textStatus)
            },
            timeout: self.requestTimeout,
        })
    })
}

HelpersClass.prototype.changeMysqlDateToNormal = function (dateTime) {
    let explodedDatetime = dateTime.split(' ')

    let dateArray = explodedDatetime[0].split('-')

    return dateArray[2] + '/' + dateArray[1] + '/' + dateArray[0] + ' ' + explodedDatetime[1]
}

HelpersClass.prototype.getCookie = function () {
    let self = this
    try {
        let token = Cookies.get('hippos-cookie')
        let cookieData = jwt_decode(token).authData
        $('.navbar-username').html(cookieData.user_name)
        self.userData = cookieData
    } catch (err) {
        console.log(`Cookie error:`, err)
        Cookies.remove('hippos-cookie')
        window.location.replace(self.LOCAL_DOMAIN + '/login')
        return null
    }
}

HelpersClass.prototype.getUserSettings = function () {
    let self = this
    $.ajax({
        url: self.LOCAL_API + `userSettings/${self.userData.user_id}`,
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.status === 200) {
                console.log(`User settings retrieved...`)
                self.userSettings = response.data[0].user_settings_value
            } else {
                self.Helpers.toastrServerError()
            }
        },
        error: function (jqXHR, textStatus) {
            self.Helpers.swalServerError()
            console.log(jqXHR, textStatus)
        },
        timeout: self.requestTimeout,
    })
}
