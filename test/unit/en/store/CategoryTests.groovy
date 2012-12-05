package en.store

import grails.test.*

class CategoryTests extends GrailsUnitTestCase {
	
    protected void setUp() {
        super.setUp()
		mockDomain(Category)
	
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }
	
	void testBlank() {
		def c = new Category(name: '', description: '')
		assertFalse c.validate()

		def user = new User(username: 'admin', firstName: 'testfn', lastName: 'testln')
		c = new Category(name: 'Cat1',description: 'Categoria 1', user: user)
		assertTrue c.validate()
	}
}
