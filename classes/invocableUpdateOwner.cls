global class invocableUpdateOwner {
   
    @InvocableMethod(label = 'Actualizar OwnerId' description = 'Actualización del OwnerId' )
    global static void updateOwnerId ( List<invocableUpdateOwnerRequest> requests ){
       
        Map<Id, Id> updObjects = new Map<Id, Id>(); 
  		
        for (invocableUpdateOwnerRequest thisReq : requests) {
        	updObjects.put(thisReq.recordId, thisReq.ownerId);	       
            }
        
        Schema.SObjectType token = requests[0].recordId.getSobjectType();
        Schema.DescribeSObjectResult dr = token.getDescribe();
        system.debug(dr.getName());
        
        String queryString = 'SELECT ownerId FROM ' + dr.getName() + ' WHERE ';
        for (ID objId : updObjects.keySet()) {
            queryString += 'Id=\'' + objId + '\' OR ';
        }
        queryString = queryString.substring(0, queryString.length()-4);
        system.debug(queryString);
        
        SObject[] objDBList = Database.query(queryString);
        System.assert(objDBList.size()>0);
        system.debug(objDBLIst);
        for (Integer i=0; i<objDBList.size(); i++) {
            objDBList[i].put('ownerId', updObjects.get(objDBList[i].Id));           
        }
        
        Database.SaveResult[] srList = Database.update(objDBList, false);
        
        for(Database.SaveResult sr : srList) {
            
            if(sr.isSuccess()) {
                system.debug ('Actualización del OnwerId correcta de ' + dr.getName() + ' Id ' + sr.getId());
            }
            else {
                system.debug('Errores en la actualización de ' + dr.getName() + ' Id ' + sr.getId());
                for (Database.Error e : sr.getErrors()){
                    System.debug(e.getMessage());
                }
            }
            
        }
            
    }
    
    global class invocableUpdateOwnerRequest {

        @InvocableVariable( label = 'Id de propietario' description = 'Id del usuario que sera propietario del registro'required=true )
        global ID ownerId;
        @InvocableVariable( label = 'Id de registro' description = 'Id del registro a cambiar propietario' required=true )
        global ID recordId;
               
    }
}