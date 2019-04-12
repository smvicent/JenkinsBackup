public class DailyLeadProcessor implements Schedulable {

    public void execute (SchedulableContext ctx) {
        
        List<Lead> updLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        for (Lead myLead : updLeads) {
            myLead.LeadSource = 'Dreamforce';
        }
        System.debug('Leads to update: ' + updLeads.size());
        update updLeads;
    }
    
}