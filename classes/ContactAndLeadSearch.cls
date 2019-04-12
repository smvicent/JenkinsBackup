public class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads (String sName) {
        
        List<List<SObject>> searchList = [FIND :sName IN ALL FIELDS 
                                          RETURNING Contact(FirstName, LastName),
                                         Lead(FirstName, Lastname)];
        return searchList;
    }
}