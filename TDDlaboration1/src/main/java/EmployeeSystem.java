import java.util.ArrayList;

public class EmployeeSystem {

    ArrayList<Employee> EmployeeList = new ArrayList<Employee>();


    public void addEmployeeToList(Employee employee) {
        EmployeeList.add(employee);
    }

    public Employee getEmployee(int employeeID) {
        for (Employee employee : EmployeeList) {
            if (employee.getID() == employeeID) {
                return employee; } }
        return null;
    }

    public void removeEmployeeToList(int employeeID) {

        EmployeeList.removeIf(employee -> employee.getID() == employeeID);
        }

    public void increaseAllSalaries(double procent) {
        if(procent<=100 && procent >= 0) {
            procent = 1 + (procent / 100);
            for (Employee employee : EmployeeList) {
                employee.setSalary(employee.getSalary() * procent);
            } }
    }


    public void increaseSalaryForEmployee(int id, double procent) {
        if(procent<=100 && procent >= 0){
        procent = 1+(procent/100);
        for (Employee employee : EmployeeList){
            if(employee.getID() == id){
                employee.setSalary(employee.getSalary()*procent); } }

    }
  }}

