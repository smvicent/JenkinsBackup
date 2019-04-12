public class ContactSearch {

    public static List<Contact> searchForContacts (String conLastName, String conMailingPC) {
        
        List<Contact> conFound = [SELECT Name FROM Contact 
                                  WHERE LastName = :conLastName 
                                  AND MailingPostalCode = :conMailingPC];
        return conFound;
    } 
}