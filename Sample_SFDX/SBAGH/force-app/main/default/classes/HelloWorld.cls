public class HelloWorld {
public void addHelloWorld(List<Account> acc) {
for(Account a:acc)
{
    if(a.Hello__c!='World')
  {
      a.Hello__c='World';
   }
}
}
}