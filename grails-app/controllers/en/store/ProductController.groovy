package en.store

class ProductController {

	def beforeInterceptor = [action:this.&auth,except:['list', 'show']]
	// defined as a regular method so its private
	def auth() {
		if(!session.user) {
			redirect(controller:'user')
			return false
		}
	}

	static defaultAction = 'list'

	def create = {
		// new user posts new product details
		if (request.method == 'POST') {
			// create domain object and assign parameters using data binding
			def p = new Product(params)

			if (! p.save()) {
				// validation failed, render registration page again
				return [product:p]
			} else {
				// validate/save ok, store user in session, redirect to homepage
				redirect(controller:'product', action:'list')
			}
		}
	}

	def list = {
		def pList = Product.list(params) ;
		[productList: pList]
	}


	def show = {
		println params
		Product p = Product.get(params.id)
		return [product : p ]
	}

	def edit = {
		println params
		Product p = Product.get(params.id)
		return [product : p ]
	}

	def update = {
		println params
		Product p = Product.get(params.id)
		p.properties = params
		p.save()
		redirect(action:list)
	}

	def delete = {
		println params
		Product p = Product.get(params.id)
		p.delete()
		redirect(action:list)
	}

}
