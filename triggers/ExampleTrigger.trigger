trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('smartinez@ayudaenaccion.org', 'Trailhead Trigger Tutorial',
                    recordCount + ' contact(s) were inserted.');   
    }
    if(Trigger.isDelete) {
        // Bla bla bla
    }
}