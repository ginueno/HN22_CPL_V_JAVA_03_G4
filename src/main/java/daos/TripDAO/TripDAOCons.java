package daos.TripDAO;

public class TripDAOCons {
    public static final String TRIP_QUERY_GET_ALL = "SELECT * FROM trip";
    public static final String TRIP_QUERY_GET_BY_TRIPID = "SELECT * FROM trip WHERE tripId = ?";
    public static final String TRIP_QUERY_INSERT = "INSERT INTO trip(carType,departureDate,departureTime,destination,driver,maximumOnlineTicketNumber,bookedTicketNumber) VALUES (?,?,?,?,?,?,0)";
    public static final String TRIP_QUERY_UPDATE = "UPDATE trip set carType = ?,departureDate = ?,departureTime = ?,destination = ?,driver = ?,maximumOnlineTicketNumber = ? where tripId = ?";
    public static final String TRIP_QUERY_REMOVE_BY_TRIPID = "DELETE FROM trip WHERE tripId = ?";
    public static final String TRIP_QUERY_GET_DESTINATION_BY_TRIPID = "SELECT destination FROM trip WHERE tripId = ?";
    public static final String SUCCESS = "success";
    public static final String FAIL = "failed";
}
