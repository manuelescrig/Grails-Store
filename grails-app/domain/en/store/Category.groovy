package en.store

class Category {
	// time stamps
	Date dateCreated
	Date lastUpdated


	// properties
	String name
	String description


	static hasMany = [products:Product]
	static belongsTo = [user:User]

	// constraints
	static constraints = {
		name(unique:true)
		description(blank:false)
	}

	String toString() { return name }
}
