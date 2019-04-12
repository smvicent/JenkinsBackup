public class MCSettingController {

    public MarketingCampaigns__c setting {get; set;}
    
    public List<SelectOption> options {get; set;}
    
    public MCSettingController() {
        String settingId = ApexPages.currentPage().getParameters().get( 'id' );
        if (settingId != null ) {
            setting = [SELECT Id, Name, Active__c, Origin__c  FROM MarketingCampaigns__c WHERE Id = :settingId];
        } else {
            setting = new MarketingCampaigns__c();
        }
        
       options = new List<SelectOption>();
       options.add(new SelectOption('0001', 'Test 01'));
       options.add(new SelectOption('0002', 'Test 02'));
    }
    
   
    
    public PageReference save() {
        if (setting.Id != null) {
            update setting;
        } else {
            insert setting;
            
        
        }
        PageReference pr = Page.campanasmarketinglist;
        pr.setRedirect(true);
        return pr;
    }

}