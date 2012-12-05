package en.store

class ProductPurchasedController {

	def beforeInterceptor = [action:this.&auth]
	// defined as a regular method so its private
	def auth() {
		if(!session.user) {
			redirect(controller:'user')
			return false
		}
	}

	static defaultAction = 'list'

	def create = {

		// create domain object and assign parameters using data binding
		def product = Product.get( params.id )
		println "${product.name}"

		def p = new ProductPurchased(quantity:'1')
		p.user = session.user
		p.price = product.price
		p.totalprice = product.price
		p.product = product
		p.save()

		if(p.save()) {
			println "Product $p.id created!"
			println "Product $p.user created!"
			println "Product $p.price created!"
			println "Product $p.quantity created!"
			println "Product $p.product created!"
			redirect(controller:"bag",action:"addProduct", id:p.id)

		} else {
			println "Product $p not created!"
			redirect(controller:"main")
		}

	}
	
	def addOne = {
		ProductPurchased p = ProductPurchased.get( params.id )
		p.totalprice = p.totalprice + p.price
		p.quantity += 1
		p.save()
		
		Bag b = Bag.get(session.user.id).save()

		// Add one more item
		b.items += 1
		// Add the price of product
		b.total += p.price

		session.bag = b
		redirect(controller:"bag", action:"show", id:"${session.user.id}")
	}
	
	def deleteOne = {
		ProductPurchased p = ProductPurchased.get( params.id )
		if (p.quantity == 1) {
			redirect(controller:"bag", action:"removeProduct", id:"${p.id}")
		}
		else {
			p.totalprice = p.totalprice - p.price
			p.quantity -= 1
			p.save()
			
			Bag b = Bag.get(session.user.id).save()
	
			b.items -= 1
			b.total -= p.price
	
			session.bag = b
			redirect(controller:"bag", action:"show", id:"${session.user.id}")		
		}
	}

}
