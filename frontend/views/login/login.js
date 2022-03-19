let LoginClass = function () {
    this.Helpers = new HelpersClass()
    this.Server = new ServerClass(this.Helpers)
    let self = this

    if (self.Helpers.autologin == true && didClientLogout == false) {
        $('#username').val(self.Helpers.autologin_user)
        $('#password').val(self.Helpers.autologin_password)

        self.submitLoginForm()
    }
    self.initializeUsers()
}

LoginClass.prototype.initializeUsers = async function () {
    let self = this

    const users = await self.Server.getData('users')
    if (users == null) return
    for (let user of users) {
        $('#users-div').append(`<button data-username="${user.user_name}" class='btn btn-primary user-btn'>${user.user_name}</button>`)
    }

    $('.user-btn').on('click', function () {
        $('#username').val($(this).data('username'))
    })
}

LoginClass.prototype.submitLoginForm = async function () {
    let self = this
    var user_name = $('#username').val()
    var user_password = $('#password').val()

    var userData = {
        userData: {
            username: user_name,
            password: user_password,
            login_datetime: self.Helpers.getTodayDate(),
        },
    }

    const response = await self.Server.postData('users/authenticate', userData)
    if (response == null) return

    if (response.status === 200) {
        console.log(response)
        let token = response.data
        Cookies.set('hippos-cookie', token)
        let dec = jwt_decode(token)
        if (dec.authData.user_role_id == 2) {
            window.location.replace(self.Helpers.LOCAL_DOMAIN + '/admin/dashboard')
        } else {
            window.location.replace(self.Helpers.LOCAL_DOMAIN + '/takeaway/')
        }
    } else {
        swal({
            title: 'Αποτυχία',
            text: 'Το όνομα χρήστη ή ο κωδικός πρόσβασης είναι λάθος. Προσπαθήστε ξανά.',
            type: 'error',
            showCancelButton: false,
            showConfirmButton: false,
            cancelButtonText: 'Άκυρο',
            confirmButtonColor: '#2fdc17',
            confirmButtonText: 'OK',
            closeOnConfirm: true,
            timer: 5000,
        })
    }
}
