trigger AccountDeletion on Account (before delete) {
    
    for (Account a : [SELECT Id from Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                      Id in :Trigger.old]) {
                Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opps');
                      }

}