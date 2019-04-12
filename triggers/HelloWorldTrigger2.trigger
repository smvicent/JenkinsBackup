trigger HelloWorldTrigger2 on Account (before insert) {
    for (Account a : Trigger.New) {
        a.Description = 'Test trigger';
        }
}