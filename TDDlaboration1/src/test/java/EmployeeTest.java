import org.junit.jupiter.api.*;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static sun.nio.cs.Surrogate.is;
import static org.junit.matchers.JUnitMatchers.*;


public class EmployeeTest {
    Employee testObject;
    Employee testObjectSam;

    @BeforeEach
    void initMethod() {
        testObject = new Employee("Vincent", "Adler", 28,55000);
    }

    @Test
    @DisplayName("Test employee first name")
    void testGetFirstName() {
        assertEquals("Vincent", testObject.getFirstName(), "Should result in 'Vincent'");
    }

    @Test
    @DisplayName("Test employee set first name")
    void testSetFirstName() {
        testObject.setFirstName("Vince");
        System.out.println(testObject.getID());
        assertEquals("Vince", testObject.getFirstName(), "Should result in 'Vince'");
    }

    @Test
    @DisplayName("Test employee last name")
    void testGetLastName() {
        assertEquals("Adler", testObject.getLastName(), "Should result in 'Adler'");
    }

    @Test
    @DisplayName("Test employee set last name")
    void testSetLastName() {
        testObject.setLastName("Adde");
        assertEquals("Adde", testObject.getLastName(), "Should result in 'Adde'");
    }

    @Test
    @DisplayName("Test employee age")
    void testGetAge() {
        assertEquals(28, testObject.getAge(), "Should result in '28'");
    }

    @Test
    @DisplayName("Test set employee age")
    void testSetAge() {
        testObject.setAge(29);
        assertEquals(29, testObject.getAge(), "Should result in '29'");
    }

    @Test
    @DisplayName("Test employee ID")
    void testEmployeeID() {

        assertTrue(Integer.class.isInstance(testObject.getID())); // Integer klassen besitter metoden isInstance().
    }

    @RepeatedTest(10)
    @DisplayName("Test unique employee ID")
    void testUniqueEmployeeID() {
        testObjectSam = new Employee("Samuela", "Lundborg", 23, 65000);
        assertFalse(testObjectSam.getID() == testObject.getID());
    }


    @Test
    @DisplayName("Test employee get salary")
    void testGetSalary() {
        assertEquals(55000, testObject.getSalary(), "Should result in '55000'");
    }

    @Test
    @DisplayName("Test employee set salary")
    void testSetSalary() {
        testObject.setSalary(60000);
        assertEquals(60000, testObject.getSalary(), "Should result in '60000'");
    }
    @Test
    @DisplayName("consTest")
    void testConstructor(){
        testGetSalary();
        testGetAge();
        testGetFirstName();
        testGetLastName();
    }


    @Test
    @DisplayName("ToString Test")
    void testToString(){
        assertEquals("{ Name:Vincent Adler Age: 28 EmployeeID: 2 Salary: 55000.0 }",testObject.toString());
    }


}
