public class AddPrimaryContact implements Queueable{
    
    private Contact contacto;
    private String state;
    
    public AddPrimaryContact(Contact con, String st) {
        this.contacto = con;
        state = st;
    
    }
    
    public void execute(QueueableContext context) {
        List<Contact> lstContactos = new List<Contact>();
        for (Account acc : [SELECT Id FROM Account WHERE BillingState =: state LIMIT 200]) {
            Contact newCon = contacto.clone();
            newcon.AccountId = acc.id;
            lstContactos.add(newCon);
        }
        insert lstContactos;
    }
    

}