trigger HelloWorldTrigger on Book__c (before insert) {

   Book__c[] books = Trigger.new;

// Test from server

   MyHelloWorld.applyDiscount(books);
}