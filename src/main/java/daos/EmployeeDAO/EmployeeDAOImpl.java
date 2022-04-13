package daos.EmployeeDAO;

import entities.Employee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeDAOImpl implements iEmployeeDAO{
    @Override
    public List<Employee> getAll() throws SQLException {
        return null;
    }

    @Override
    public Employee select() throws SQLException {
        return null;
    }

    @Override
    public boolean add(Employee employee) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Employee employee) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }
}
