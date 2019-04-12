@isTest
public class AddPrimaryContactTest {

       	
    @isTest static void testQueueable() {
        
        List<Account> lstAcc = new List<Account>();
        Contact con = new Contact(FirstName = 'Test', LastName='Test');
        
        // 50 records BillingState NY
        // 50 records BillingStateCA
        for (Integer i = 0; i<50; ++i ) {
            Account accNY = new Account (Name='Account NY' + i, BillingState='NY');
            Account accCA = new Account (Name='Account CA' + i, BillingState='CA');
            lstAcc.add(accNY);
            lstAcc.add(accCA);
        }
        
		// Insert Accounts & PrimaryContact
		insert lstAcc;
        insert con;
        
        // Create Queueable instance and run
        AddPrimaryContact updContacts = new AddPrimaryContact(con, 'CA');
        Test.startTest();
        system.enqueueJob(updContacts);
        Test.stopTest();
        
        // Validate
                       
        System.assertEquals(50, [Select count() FROM Contact WHERE Account.BillingState = 'CA']);
        System.assertEquals(0, [Select count() FROM Contact WHERE Account.BillingState = 'NY']);
           
	} 
}