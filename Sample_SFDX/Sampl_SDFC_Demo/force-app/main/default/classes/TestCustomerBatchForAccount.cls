public class TestCustomerBatchForAccount {

   /*public string myname{get; set;}
   public pageReference show(){
      CustomerBatchForAccount mybatch = new CustomerBatchForAccount (myname);
      Id id = Database.executeBatch (mybatch, 400);
       system.debug('Batch Value ---> '+id);
      system.debug ('My Job id' + id);
      return null; */
    
    public String searchInput {set;get;}

    public List<Customer__c> Result{get;set;}

    public List<Customer__c> Updatedlist = new List<Customer__c>();
    public TestCustomerBatchForAccount()  
    {

       Result = new List<Customer__c>();
       //checkstring = apexpages.currentpage.getParameters.get('SearchInputString');

     //  SearchBox();

    }

    public PageReference SearchBox()
    {
        Result = [select Id,Name,Account_type__c from Customer__c where Name =:searchInput]; 

        for(Customer__c cst : Result)
        {
            if(cst.Account_type__c == 'Current')
            {
                cst.Account_type__c='Saving';
                Updatedlist.add(cst);
            }

        }
        if(!Updatedlist.isEmpty())
        {
            update Updatedlist;
        }


         return null;   

    } 

}