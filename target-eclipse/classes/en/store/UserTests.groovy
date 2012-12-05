package en.store

import grails.test.*

class UserTests extends GrailsUnitTestCase {
	

    protected void setUp() {
        super.setUp()
		mockDomain(User)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }
	
	void testUnique() {
		// Test user to test uniqueness of username property.
		def user1 = new User(username: 'admin', firstName: 'testfn', lastName: 'testln', password:'hello', confirm:'hello')
		def user2 = new User(username: 'admin2', firstName: 'testfn', lastName: 'testln', password:'hello', confirm:'hello')

		assertTrue user1.validate()
		assertTrue user2.validate()
		
		assertEquals (user1, user1.save())

	}
}
