package en.store

import grails.test.*

class ProductPurchasedTests extends GrailsUnitTestCase {
	protected void setUp() {
		super.setUp()
		mockDomain(ProductPurchased)
	}

	protected void tearDown() {
		super.tearDown()
	}

	void testSomething() {
	}

	void testValidate() {
		def user = new User(username: 'admin', firstName: 'testfn', lastName: 'testln')
		def c = new Category(name: 'Cat1',description: 'Categoria 1', user: user)
		def p = new Product(name:'p1',description:'des1',  price:2.34, stock:'3', user:user, category:c)
		def b1 = new Bag(items:'4', total:34.3, user:user)
		def pp = new ProductPurchased(price: 34, quantity:'10', totalprice: 35, product: p, bag:b1, user:user )

		assertTrue pp.validate()
	}
}
