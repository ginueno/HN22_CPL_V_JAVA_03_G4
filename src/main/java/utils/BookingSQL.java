package utils;

public class BookingSQL {
    public static String getAllBooking ="select* from bookingoffice";
    public static String addBooking ="insert into bookingoffice values(?,?,?,?,?,?,?)";
    public static String listPlace ="select DISTINCT officePlace from bookingoffice";
    public static String listTrip="select tripId ,destination from trip";
    public static String viewBooking="select * from bookingoffice where officeId=?";
    public static String updateBooking="update bookingoffice set endContractDeadline=?,officeName =?,officePhone=?,officePlace=?,officePrice=?,startContractDeadline=?,tripId=? where officeId=?";
    public static String deleteBooking="delete bookingoffice where officeId=?";




}
