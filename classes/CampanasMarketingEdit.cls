public class CampanasMarketingEdit {

    public List<MarketingCampaigns__c> settingLst {get; set;}
    
    public CampanasMarketingEdit() {
       
            settingLst = [SELECT Id, Name, Active__c, Origin__c FROM MarketingCampaigns__c ORDER BY Name];
        
        }
  
    
    public PageReference save() {
        upsert settingLst;
        PageReference pr = Page.campanasmarketinglist;
        return pr;
        
    }
    
     public PageReference Nueva() {
        // MarketingCampaigns__c newCampaign = new MarketingCampaigns__c();
        // settingLst.add(newCampaign);     
        
        PageReference pr = Page.campanasmarketing;
        return pr;
        
    }


}