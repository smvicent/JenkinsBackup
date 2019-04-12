@isTest
public class AccountProcessorTest {

    @isTest static void countContactTest() {
    
        Account acc1 = new Account (Name = 'Account Test 001');
        insert acc1;
        Account acc2 = new Account (Name = 'Account Test 002');
        insert acc2;
        
        List<ID> accId = new List<ID>();
        accId.add(acc1.Id);
        accId.add(acc2.Id);
        
        Contact con1 = new Contact (FirstName = 'Test 01', LastName='Account Test 001', AccountId = accId[0]);
        Contact con2 = new Contact (FirstName = 'Test 02', LastName='Account Test 002', AccountId = accId[1]);
        Contact con3 = new Contact (FirstName = 'Test 03', LastName='Account Test 002', AccountId = accId[1]);
        insert con1;
        insert con2;
        insert con3;
        
        test.startTest();
        
        AccountProcessor.countContacts(accId);
        
        test.stopTest();
        
        List<Account> updAccounts = [SELECT Id, Number_of_Contacts__c 
                                     FROM Account WHERE Id =:accId];
        
        System.assertEquals(1, updAccounts[0].Number_of_Contacts__c);
        System.assertEquals(2, updAccounts[1].Number_of_Contacts__c);
        
     }
}