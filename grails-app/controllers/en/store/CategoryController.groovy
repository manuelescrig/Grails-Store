package en.store

import java.util.List;

class CategoryController {
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
			def c = new Category(params)

			if (! c.save()) {
				// validation failed, render registration page again
				return [category:c]
			} else {
				// validate/save ok, store user in session, redirect to homepage
				redirect(controller:'category', action:'list')
			}
		}
	}

	def list = {
		def cList = Category.list(params) ;
		[categoryList: cList]
	}


	def show = {
		println params
		Category c = Category.get(params.id)
		return [category : c ]

	}

	def edit = {
		println params
		Category c = Category.get(params.id)
		return [category : c ]
	}

	def update = {
		println params
		Category c = Category.get(params.id)
		c.properties = params
		c.save()
		redirect(action:list)
	}

	def delete = {
		println params
		Category c = Category.get(params.id)
		c.delete()
		redirect(action:list)
	}


}
