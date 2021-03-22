public class Employee {

    private String firstName;
    private String lastName;
    private int age;
    private double salary;
    private static int employeeID;
    private int employeeRealID;


    public Employee(String firstName, String lastName, int age, double salary) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.salary = salary;
        employeeID += 1;
        employeeRealID = employeeID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getID() { return employeeRealID; }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String toString(){
        return "{ " + "Name:" + firstName+ " " + lastName + " Age: " + age + " EmployeeID: " + employeeRealID + " Salary: " + salary + " }";
    }
}
