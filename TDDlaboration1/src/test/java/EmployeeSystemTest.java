import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

public class EmployeeSystemTest {
    EmployeeSystem testObject;
    Employee testPersonal;
    Employee testPersonal2;

    @BeforeEach
    void initMethod() {
        testObject = new EmployeeSystem();
        testPersonal = new Employee("Vince", "Adler", 28, 55000);
        testPersonal2 = new Employee("Adam", "Adler", 28, 55000);
    }


    @Test
    @DisplayName("AddToListTest")
    void addEmployeeToList() {
        testObject.addEmployeeToList(testPersonal);
        assertEquals(testPersonal, testObject.getEmployee(1));
    }
    // If you want to test that a specific employee was added to ArrayList you need to use Dictionaries.


    @Test
    @DisplayName("RemoveFromArrayListTest")
    void removeEmployeeFromList() {
        testObject.addEmployeeToList(testPersonal);
        // testObject.addEmployeeToList(testPersonal2);
        testObject.removeEmployeeToList(testPersonal.getID());
        assertNull(testObject.getEmployee(testPersonal.getID()));
    }

    @Test
    @DisplayName("IncreaseSalaryTest")
    void testIncreaseAllSalaryTest(){
        testObject.addEmployeeToList(testPersonal);
        testObject.addEmployeeToList(testPersonal2);
        testObject.increaseAllSalaries(100);
        assertAll(
                () ->    assertEquals(110000, testPersonal.getSalary()),
                () ->    assertEquals(110000, testPersonal2.getSalary())
        );

    }

    @Test
    @DisplayName("IncreaseSalaryMoreThan100%")
    void testIncreaseMoreThan100(){
        testObject.addEmployeeToList(testPersonal);
        testObject.increaseAllSalaries(110);
        assertEquals(55000, testPersonal.getSalary());
    }

    @Test
    @DisplayName("IncreaseSalaryTest")
    void testIncreaseNegativeValues(){
        testObject.addEmployeeToList(testPersonal);
        testObject.increaseAllSalaries(-100);
        assertEquals(55000, testPersonal.getSalary());
    }



    @Test
    @DisplayName("IncreaseSalaryTest")
    void testIncreaseEmployeeSalaryTest(){
        testObject.addEmployeeToList(testPersonal2);
        testObject.addEmployeeToList(testPersonal);
        testObject.increaseSalaryForEmployee(testPersonal.getID(), 2);

        assertAll (
                () ->     assertEquals(56100, testPersonal.getSalary()),
                () ->     assertEquals(55000, testPersonal2.getSalary())

        );

    }

    @Test
    @DisplayName("IncreaseSalaryTest")
    void testIncreaseEmployeeAbove100Test(){
        testObject.addEmployeeToList(testPersonal);
        testObject.increaseSalaryForEmployee(testPersonal.getID(), 200);
        assertEquals(55000, testPersonal.getSalary());
    }

    @Test
    @DisplayName("IncreaseSalaryTest")
    void testIncreaseEmployeeNegativeTest(){

        testObject.addEmployeeToList(testPersonal);
        testObject.increaseSalaryForEmployee(testPersonal.getID(), -2);
        assertEquals(55000, testPersonal.getSalary());
    }






}


