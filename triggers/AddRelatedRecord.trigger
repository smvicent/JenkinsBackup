trigger AddRelatedRecord on Account (after insert, after update) {
List<Opportunity> oppList = new List<Opportunity>();
 
for (Account a : [SELECT Id, Name FROM Account
                  WHERE Id NOT IN (SELECT AccountId from Opportunity)]) {
                      oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                                 StageName = 'Prospecting',
                                                 CloseDate = System.today().addMonths(1),
                                                 AccountId = a.Id));
                      
                  } 
    if (oppList.size()>0) {
        insert oppList;
    }

    
    }