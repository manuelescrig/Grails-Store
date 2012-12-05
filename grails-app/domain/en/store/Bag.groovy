package en.store

import java.util.Date;

class Bag {
	// time stamps
	Date dateCreated
	Date lastUpdated

	// properties
	int items
	Float total

	static hasMany = [products:ProductPurchased]
	static belongsTo = [user:User]

	// constraints
	static constraints = {
		total(blnak:false, scale:2)
		items(blank:false)
	}
}
