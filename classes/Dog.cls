public class Dog
{
    public Integer age;
    public String name;
    private String gender;
    public String breed;
    public Boolean isPuppy;
    public static Integer numDogs = 0;
    
    public Dog(String Name){
        this.Name=Name;
        ++numDogs;
    }
    public void setGender(Boolean isMale){
        gender = isMale ? 'Male' : 'Female';
    }
    public String getGender() {
        return gender;
    }
    
    public Integer countDogs() {
		return   numDogs;     
    }
}