public class TriggerDispatcher 
{
	
	public static void Run(ITriggerHandler handler)
	{
		
		if (handler.IsDisabled())
            // Salimos si está desactivado
			return;
        
        // Logica Before Triggers
		if (Trigger.IsBefore )
		{
			if (Trigger.IsInsert)
				handler.BeforeInsert(trigger.new);	
            
			if (Trigger.IsUpdate)
				handler.BeforeUpdate(trigger.newMap, trigger.oldMap);
	
			if (Trigger.IsDelete)
				handler.BeforeDelete(trigger.oldMap);
		}
        
        //  // Logica After Triggers
		if (Trigger.IsAfter)
		{
			if (Trigger.IsInsert)
				handler.AfterInsert(Trigger.newMap);
            
			if (Trigger.IsUpdate)
				handler.AfterUpdate(trigger.newMap, trigger.oldMap);
            
            if (trigger.IsDelete)
				handler.AfterDelete(trigger.oldMap);
            
			if (trigger.isUndelete)
				handler.AfterUndelete(trigger.oldMap);
		}
	}
}