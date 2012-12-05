package en.store

class ProductPurchased {
	// time stamps
	Date dateCreated
	Date lastUpdated

	// properties
	Float price
	Float totalprice
	Integer quantity
	Product product
	Bag bag

	static belongsTo = [user:User, bag:Bag, product:Product]

	// constraints
	static constraints = {
		price(scale:2)
		totalprice(scale:2)
		quantity(min:1)
		product(nullable:false)
		bag(nullable:true)
	}

}

