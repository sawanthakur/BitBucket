global class CustomerBatchForAccount implements Database.Batchable <sObject>{

    public string myname;
    global CustomerBatchForAccount(String myname){
       this.myname = myname;
    }
    global Database.QueryLocator Start(Database.BatchableContext BC){
       //return Database.getQueryLocator('SELECT id FROM Account WHERE Name:'+ myname);
       
       try {
       String query = 'SELECT id, Name FROM Account WHERE Name='+ myname;
       System.debug('QQQQQQQ'+query);
       return Database.getQueryLocator(query);
     }catch(Exception e) {
        System.debug('ERROR : IN start method'+e); 
     }
     return null;

    }
    global void execute(Database.BatchableContext BC, List<Customer__c> Scope){
       List<Customer__c> cust = new List<Customer__c>();
       for(Customer__c c : cust){
          //c.Account_Type__c = 'Saving';
          cust.add(c);
       } 
       update cust;
    } 
    global void finish (Database.BatchableContext BC){
       //Method to send and email 
      /* Messaging.singleEmailMessage myemail = new Messaging.singleEmailMessage();

       String[] toadd = new String[] {'bsawan4@gmail.com'};
       myemail.setToAddress(toadd);
       myemail.setSubject('Batchprocessed');
       myemail.setplainTextBody('Batch completed successfully');
       Messaging.sendEmail(new Messaging.Email(){myemail}); */
    } 

}