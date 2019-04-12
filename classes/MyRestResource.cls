@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {
    @HttpGet
    global static List<Account> getRecords() {
        return [Select Id, Name from Account where Name like 'Test%'];
    }
}