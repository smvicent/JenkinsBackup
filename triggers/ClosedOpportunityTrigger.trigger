trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
List<Task> relTask = new List<Task>();
    for (Opportunity opp : Trigger.New) {
        if (opp.StageName == 'Closed Won') {
            relTask.add(new Task(WhatId=opp.id, subject='Follow Up Test Task'));
        }
    }
    
    if (relTask.size()>0) {
        insert relTask;
    }
    
}