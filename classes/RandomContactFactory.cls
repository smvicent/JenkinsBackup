public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts (Integer numContacts, String nameContacts) {
        
        List<Contact> lstContacts = new List<Contact>();
        for (Integer i=1;i<=numContacts;++i ){
            lstContacts.add(new Contact (FirstName = nameContacts + '' + i));
        }
        
        return lstContacts;
        
    }

}