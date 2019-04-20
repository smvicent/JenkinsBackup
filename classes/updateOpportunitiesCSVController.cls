public class updateOpportunitiesCSVController {
    /*
	public Blob csvFileBody{get;set;}
	public String csvAsString{get;set;}
    public String Estado{get;set;}
    public Integer Registros{get;set;}
    public Integer lineasFichero{get;set;}
	public List<String> csvFileLines{get;set;}
	public List<Opportunity> lstOpps{get;set;}
    
    public Map<Id, List<String>> mapcsv;
    
  	
    public updateOpportunitiesCSVController(){
    	csvFileLines = new List<String>();
        lstOpps = new List<Opportunity>();
    	mapcsv = new Map<Id, List<String>>();
        Estado = 'Pendiente';
        Registros = 0;
        lineasFichero = 0;
  }
  
  	public void importCSVFile(){
       try{
           csvAsString = csvFileBody.toString();
           csvFileLines = csvAsString.split('\n'); 
           lineasFichero = csvFileLines.size();          
           for(Integer i=1;i<csvFileLines.size();i++){
               List<String> csvRecord = csvFileLines[i].split(',');
               mapcsv.put(csvRecord[0], csvRecord);
           	}
            
        	lstOpps = [SELECT Id, AccountId, StageName, LeadSource, Description FROM Opportunity 
                      WHERE AccountId IN :mapcsv.keySet()];
                      
           for (Opportunity opp : lstOpps) {
               List<String> csvRecordData = mapcsv.get(opp.AccountId); 
               System.debug('csv Record: ' + csvRecordData);
               opp.StageName = csvRecordData[1];
               opp.LeadSource = csvRecordData[2];
               opp.Description = csvRecordData[3];
           }
           system.debug('Lista Oportunidades ' + lstOpps.size());
           update lstOpps;
           Registros = lstOpps.size();
           Estado = 'Carga realizada';
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'Error importando datos');
            ApexPages.addMessage(errorMessage);
        }  
        
  }
  */    
}