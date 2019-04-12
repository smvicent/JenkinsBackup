@isTest
private class TestRestrictContactByName {

    @isTest static void testUpdateInvalidName() {
    	
        Contact c = new Contact(FirstName = 'Pepito', LastName ='INVALIDNAME');
        //insert c;
        test.startTest();
        database.SaveResult result = Database.insert(c, false);
        test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
        
	}        
}