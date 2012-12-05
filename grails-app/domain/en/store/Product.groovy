package en.store

import java.util.Date;


class Product {
	// time stamps
	Date dateCreated
	Date lastUpdated

	// properties
	String name
	String description
	Float price
	Integer stock

	static belongsTo = [user:User, category:Category]

	// constraints
	static constraints = {
		name(blank:false,unique:true)
		description(blank:false)
		price(blank:false, scale:2)
	}

	String toString() { return name }
}
