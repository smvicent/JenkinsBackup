public class AccountProcessor {
	
    @future
    public static void countContacts(List<Id> accIds) {
        if (!accIds.isEmpty()) {
        List<Account> lstAccounts = [SELECT Id, Number_of_Contacts__c, (SELECT Id from Contacts) FROM Account 
                                     WHERE Id = :accIds];
            for (Account acct : lstAccounts) {
            	acct.Number_of_Contacts__c = acct.Contacts.size();
                } 
            system.debug ('Accounts to update ' + lstAccounts);
            update lstAccounts;
        }
       
    }
}