public class AccountTriggerHandler implements ITriggerHandler
{
    // Por si hace falta en Test
	public static Boolean TriggerDisabled = false;


	public Boolean IsDisabled()
	{
     	// Custom settings para desactivar o activar trigger
        TriggerSettings__c disBySettings = TriggerSettings__c.getValues('Account');
        Boolean disableSettings = disBySettings.TriggerDisabled__c;
        
        if (disableSettings) 
			return true;
		else
			return TriggerDisabled;
	}
    
	public void BeforeInsert(List<SObject> newItems) {}
	
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
	
    public void BeforeDelete(Map<Id, SObject> oldItems) {
   
        // Ejemplo:    
         for (Account a : [SELECT Id from Account 
                           WHERE Id IN :oldItems.KeySet()]) 
                		oldItems.get(a.Id).addError('No borres!');                    
    }
	
    public void AfterInsert(Map<Id, SObject> newItems) {}
    
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
	
    public void AfterDelete(Map<Id, SObject> oldItems) {}
	
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}