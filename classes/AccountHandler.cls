public class AccountHandler {
    public static Account insertNewAccount (String AcctName) {
    	// Comentario
    Account acct = new Account(Name = AcctName);
        try {
        	insert acct;
            }
        catch (DmlException e) {
       		System.debug(e.getMessage());
            return null;
        }
    return acct;    
    }
}