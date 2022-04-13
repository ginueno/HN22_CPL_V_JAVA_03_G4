package entities;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class Employee {
    private String employeeId;
    private String account;
    private String department;
    private String employeeAddress;
    private String employeeBirthdate;
    private String employeeEmail;
    private String employeeName;
    private String employeePhone;
    private String password;
    private String sex;
}
