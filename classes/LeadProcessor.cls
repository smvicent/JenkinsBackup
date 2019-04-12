global class LeadProcessor implements Database.Batchable<sObject> {    
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID, LeadSource FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        
        system.debug('Items to update : ' + scope.size());
        
        for (Lead ld : scope) {
            ld.LeadSource = 'Dreamforce';
            }
        update scope;
    }    

    global void finish(Database.BatchableContext bc){

        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];

        System.debug ('Job Id ' + job.id);
        System.debug ('Job Status ' + job.Status);
        System.debug ('Job NumberOfErrros ' + job.NumberOfErrors);
        System.debug ('Job Items Processed ' + job.JobItemsProcessed);
        
    }    

}