package daos.CarDAO;

import entities.Car;

import java.sql.SQLException;
import java.util.List;

public interface CarDAO {
    public List<Car> getAll() throws SQLException;
    public boolean add(Car licensePlate) throws SQLException;
    public boolean update(Car licensePlate) throws SQLException;
    public boolean delete(String licensePlate) throws SQLException;
    public Car getCarByLicensePlate(String licensePlate) throws SQLException;
    public List<Car> search(String search, String criteria) throws SQLException;
    public List<String> getAllParkId() throws SQLException;
    public List<String> getAllCompany() throws SQLException;
    public int getNumberOfCars() throws SQLException;
    public List<Car> pagingCar(int index) throws SQLException;
}