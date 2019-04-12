trigger MerchandiseTrigger on Merchandise__c (before insert) {

    for(Merchandise__c mer: Trigger.New) {
        if(mer.Discount_Type__c == 'Normal price') {
            mer.Discounted_Price__c = mer.Original_Price__c;
        } else if (mer.Discount_Type__c == 'Good price') {
            mer.Discounted_Price__c = mer.Original_Price__c*0.7;
        } else if (mer.Discount_Type__c == 'Half price') {
            mer.Discounted_Price__c = mer.Original_Price__c*0.5;
        }
    }

}