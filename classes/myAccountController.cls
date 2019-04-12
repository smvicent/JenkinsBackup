public class myAccountController {
    
    public final Account account {get; private set;}
    
    public myAccountController() {
        
        ID id = ApexPages.currentPage().getParameters().get('id');
        account = (id==null)?new Account() : [SELECT Name, Phone, Industry 
                                              FROM Account WHERE Id = :id];
        
    }
    
      
    public PageReference save() {
        try {
            upsert(account);
        } catch(System.DmlException e) {
            ApexPages.addMessages(e);
        }
         PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return (redirectSuccess);
    }

}