package en.store

class MainController {

	List products
	List categories

	def index = {
		products = Product.findAll(max:10, order:'dateCreated')
		categories = Category.list()
	}
}
