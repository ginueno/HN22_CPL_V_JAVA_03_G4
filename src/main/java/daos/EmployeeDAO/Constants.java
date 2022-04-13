package daos.EmployeeDAO;

public class Constants {
    public static String EMPLOYEE_GET_ALL = "SELECT * FROM employee";
    public static String EMPLOYEE_GET_BY_ID = "SELECT * FROM employee WHERE employeeId = ?";
    public static String EMPLOYEE_ADD = "INSERT INTO employee VALUES (?,?,?,?,?,?,?,?,?)";
    public static String EMPLOYEE_UPDATE = "UPDATE employee\n" +
            "SET account = ?\n" +
            "department = ?\n" +
            "employeeAddress = ?\n" +
            "employeeBirthdate = ?\n" +
            "employeeEmail = ?\n" +
            "employeeName = ?\n" +
            "employeePhone = ?\n" +
            "password = ?\n" +
            "sex = ?";
    public static String EMPLOYEE_DELETE = "DELETE FROM employee WHERE employeeId = ?";
}
