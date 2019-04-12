public class myControlExtension {
    
    private final Account acct;
    
    public myControlExtension (ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
        
    }
    
    public String getGreeting() {
        return 'Hello ' + acct.name;
    }

}