global class AccountProcessingBatch implements Database.Batchable<sobject> {

    global Database.QueryLocator start (Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name, Description FROM Account');
    }
    
    global void execute (Database.BatchableContext BC, List<sobject> scope) {
        List<Account> accountList = new List<Account>();
        List<Account> updatedAccountList = new List<Account>();
        
        for (sObject objScope: scope) {
            Account updatedObjScope = (Account) objScope;
            updatedObjScope.Description = 'Updated by Batch';
            updatedAccountList.add(updatedObjScope);
            System.debug('Updated' + updatedObjScope);
        }
        if (updatedAccountList !=null && updatedAccountList.size()>0) {
            Database.update(updatedAccountList);
            System.Debug ('List size ' + updatedAccountList.size());
        }
    }
    
    global void finish (Database.BatchableContext BC) {
        System.Debug ('$$$ Job Id is: ' + BC.getJobId());
    }
}