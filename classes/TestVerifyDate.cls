@IsTest
public class TestVerifyDate {
    
    //if date2 is within the next 30 days of date1, use date2.  
    @IsTest Static Void date2lessdate1Test() {
        Date fecha1 = date.newInstance(2017, 12, 16);
        Date fecha2 = date.newInstance(2017, 11, 1);
        Date fechaRes = VerifyDate.CheckDates(fecha1, fecha2);
        System.assertEquals(date.newInstance(2017, 12, 31),fechaRes);
	}        
    
    // Otherwise use the end of the month
    // 
     @IsTest Static Void endoftheMonthTest() {
        Date fecha1 = date.newInstance(2017, 9, 1);
        Date fecha2 = date.newInstance(2017, 10, 31);
        Date fechaRes = VerifyDate.CheckDates(fecha1, fecha2);
        System.assertEquals(date.newInstance(2017, 9, 30),fechaRes);
	}        
    
      @IsTest Static Void returndate2Test() {
        Date fecha1 = date.newInstance(2017, 10, 1);
        Date fecha2 = date.newInstance(2017, 10, 29);
        Date fechaRes = VerifyDate.CheckDates(fecha1, fecha2);
        System.assertEquals(fecha2,fechaRes);
	}        
}