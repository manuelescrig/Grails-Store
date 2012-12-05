package en.store

import grails.test.*


class ProductTests extends GrailsUnitTestCase {

	protected void setUp() {
		super.setUp()
		mockDomain(Product)
	}

	protected void tearDown() {
		super.tearDown()
	}

	void testSomething() {
	}

	void testValidate() {
		def user = new User(username: 'admin', firstName: 'testfn', lastName: 'testln')
		def c = new Category(name: 'Cat1',description: 'Categoria 1', user: user)
		def p = new Product(name:'p1',
				description:'des1', price:2.34, stock:'3', user:user, category:c)

		assertTrue p.validate()	
	}
}

