@isTest
private class LeadProcessorTest {

    @testSetup
    static void setup() {
        // insert leads
        List<Lead> lds = new List<Lead>();
        for (Integer i=0; i<200; ++i) {
            Lead myLead = new Lead (FirstName = 'Test ' + i, LastName='Test ' + i, Company='Test ' + i);
            lds.add(myLead);
        }
        insert lds;
    } 
    
    @isTest static void testBatch() {
        List<Lead> updLead;
        
        Test.startTest();
        LeadProcessor myBatch = new LeadProcessor(); 
		Id batchId = Database.executeBatch(myBatch);
        Test.stopTest();
        
        updLead = [SELECT Id, LeadSource FROM Lead];
        
        for (Integer i=0; i<updLead.size(); ++i) {
            System.assertEquals('Dreamforce', updLead[i].leadsource);
    	}    
    }
}