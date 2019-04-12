@isTest
private class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @isTest static void testScheduleJob() {
    
    	List<Lead> testLeads = new List<Lead>();
        for (Integer i=0; i<200; ++i) {
            Lead ld = new Lead(FirstName='Test ' + i, LastName = 'Test ' + i, Company = 'Test Company ' + i );
    		testLeads.add(ld);        
            
        }
        insert testleads;
        
		Test.startTest();
		String JobId = System.schedule('Daily Lead Processor Test', CRON_EXP, new DailyLeadProcessor());
		Test.stopTest();
		
		System.assertEquals(0,  [SELECT Count() FROM Lead WHERE LeadSource = '']); 
        System.assertEquals(200,  [SELECT Count() FROM Lead WHERE LeadSource = 'Dreamforce']); 
    }
}