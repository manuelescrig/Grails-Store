package en.store

import grails.test.*

class BagTests extends GrailsUnitTestCase {

	def user

	protected void setUp() {
		super.setUp()
		mockDomain(Bag)
	}

	protected void tearDown() {
		super.tearDown()
	}

	void testSomething() {
	}
	
	void testBlank() {
		def user = new User(username: 'admin', firstName: 'testfn', lastName: 'testln')
		def b1 = new Bag(items:'4', total:'34.3', user:user)
		assertNotNull(b1.save())


		def b2 = new Bag(items:'4', total:'34.3', user:user)
		assertTrue b2.validate()
	}
}
