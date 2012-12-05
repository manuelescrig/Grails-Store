package en.store

class UserController {
	
	static defaultAction = 'login'
	
    def register = {
        // new user posts his registration details
        if (request.method == 'POST') {
            // create domain object and assign parameters using data binding
            def u = new User(params)
            if (! u.save()) {
                // validation failed, render registration page again
                return [user:u]
            } else {
                // validate/save ok, store user in session, redirect to homepage
                session.user = u
                redirect(controller:'bag', action:'create')
            }
        } else if (session.user) {
            // don't allow registration while user is logged in
            redirect(controller:'main')
        }
    }

    def login = {
        if (request.method == 'POST') {
            def u = User.findByUsername(params.username)
            if (u) {
                // username and password match -> log in
                session.user = u
                redirect(controller:'main')
            } else {
                flash.message = "User not found"
                redirect(controller:'user')
            }
        } else if (session.user) {
            // don't allow login while user is logged in
            redirect(controller:'main')
        }
    }

    def logout = {
        session.invalidate()
        redirect(controller:'main')
    }
}
