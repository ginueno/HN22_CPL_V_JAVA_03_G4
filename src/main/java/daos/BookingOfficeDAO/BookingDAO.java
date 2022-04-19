package daos.BookingOfficeDAO;

import entities.BookingOffice;
import entities.Trip;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public interface BookingDAO {
    List<BookingOffice> getAllBooking() throws SQLException;

    boolean addBooking (Date end,String name,String phone,String place,Double price,Date start,int tripId);

    List<BookingOffice> getAllPlace() throws SQLException;

    List<Trip> getAllDestination() throws SQLException;

    BookingOffice getBookingbyId(int id) throws SQLException;

    void updateBooking(Date end,String name,String phone,String place,Double price,Date start,int tripId,int id) throws SQLException;

    void deleteBooking(int id) throws SQLException;

}
