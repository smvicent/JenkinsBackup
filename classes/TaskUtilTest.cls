@isTest
private class TaskUtilTest {
    @isTest static void testDefaultTaskPriority() {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    
     @isTest static void testNullTaskPriority() {
        String pri = TaskUtil.getTaskPriority('');
        System.assertEquals(null, pri);
    }
    
      @isTest static void testHighTaskPriority() {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
}