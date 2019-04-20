@isTest 
public class AccountProcessingBatchTest {
    
    @IsTest static void updateAccountDescriptions() {

        TriggerSettings__c accTriggerSettings = new TriggerSettings__c (Name = 'Account', TriggerDisabled__c = false);
        insert accTriggerSettings;
        List<Account> lstAccounts = new List<Account>();
        for (Integer i = 0; i<100; ++i) {
            Account acc = new Account (Name = 'Account Test ' + i);
            lstAccounts.add(acc);
        }
        insert lstAccounts;

        test.startTest();
        Id batchJobId = Database.executeBatch(new AccountProcessingBatch(), 200);
        test.stopTest();

        List<Account> updAccounts = [SELECT Name, Description FROM Account];
        for (Account acc : updAccounts) {
            System.assertEquals('Updated by Batch', acc.Description);
        }
        
    }
}