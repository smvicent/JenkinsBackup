public class Person {

/* A person should have a first name, a last name, a gender, an age, and whether it is an adult. 
 Create an instance of that Person class */
    
    public String firstName;
    public String lastName;
    public String gender;
    public Integer age;
    public boolean isAdult;
    public Double income;
    
    public Double getIncomeTax() {
        return income*0.45;
    }
      
    public String getData() {
        return firstName + ' ' + lastName + ' gender:' + gender + ' age:'+ age;
    }
}