trigger TransactionTrigger on Transaction__c (after insert) {

    List<String> relatedMerchandiseIdList = new List<String>();
    
    for (Transaction__c trans : Trigger.New) {
        relatedMerchandiseIdList.add(trans.Merchandise__c);
    } 
    
    Map<Id, Merchandise__c> merMap = new Map<Id, Merchandise__c>([SELECT Id, Overall_Revenue__c, Discounted_Price__c
                                                                FROM Merchandise__c
                                                               WHERE Id in :relatedMerchandiseIdList]);
    for (Transaction__c trans : Trigger.new){
        Merchandise__c mer = merMap.get(trans.Merchandise__c);
        if (mer.Overall_Revenue__c == null) {
            mer.Overall_Revenue__c = mer.Discounted_Price__c * trans.Amount__c;
        } else {
            mer.Overall_Revenue__c += mer.Discounted_Price__c * trans.Amount__c;
        }
        
    }
    
    update merMap.values();

}