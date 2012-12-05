package en.store

class BagController {
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
		// create domain object
		def b = new Bag(total:'0', items:'0', id:'${session.user.id}')
		b.user = session.user
		session.bag = b
		b.save()
		if(b.save()) {
			println "Bag $b created!"
		} else {
			println "Bag $b not created!"
		}

		redirect(controller:'main')

	}

	def list = {
		def bList = Bag.list(params) ;
		[bagList: bList]
	}


	def show = {
		println params
		Bag b = Bag.get(params.id)
		println b.user.firstName
		return [bag : b ]
	}

	def edit = {
		println params
		Bag b = Bag.get(params.id)
		return [bag : b ]
	}

	def update = {
		println params
		Bag b = Bag.get(params.id)
		b.properties = params
		b.save()
		redirect(action:'list')
	}

	def delete = {
		println params
		Bag b = Bag.get(params.id)
		b.delete()
		redirect(action:'list')
	}

	def addProduct = {
		def p = ProductPurchased.get( params.id )
		println "${p.id}"

		Bag b = Bag.get(session.user.id)
				.addToProducts(p)
				.save()

		// Add one more item
		b.items += p.quantity
		// Add the price of product
		b.total += p.price

		session.bag = b
		println "Count 1: ${b.count()}"
		println "Count 2: ${b.items}"

		if (p.save()) {
			println "Product added to the bag"
			redirect(controller:"bag", action:"show", id:"${session.user.id}")
		}
		else {
			println "Product NOT added to the bag"
			redirect(controller:"bag", action:"show", id:"${session.user.id}")
		}
	}

	def removeProduct = {
		def p = ProductPurchased.get( params.id )
		println "${p.product.name}"

		Bag b = Bag.get(session.user.id)
				.removeFromProducts(p)
				.save()

		// Delete one more item
		b.items -= p.quantity
		// Delete the price of product
		b.total -= p.totalprice
		// The price cannot be less than 0
		if (b.total < 0)
			b.total = 0

		session.bag = b
		println "Count 1: ${b.count()}"
		println "Count 2: ${b.items}"

		if (p.save()) {
			redirect(controller:"bag", action:"show", id:"${session.user.id}")
		}
		else {
			redirect(controller:"bag", action:"show", id:"${session.user.id}")
		}
	}

}
