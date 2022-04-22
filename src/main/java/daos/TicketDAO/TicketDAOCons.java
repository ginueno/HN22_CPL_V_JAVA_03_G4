package daos.TicketDAO;

public class TicketDAOCons {
    public static final String TICKET_QUERY_GET_ALL = "SELECT * FROM ticket";
    public static final String TICKET_QUERY_GET_BY_TICKETID = "SELECT * FROM ticket WHERE ticketId = ?";
    public static final String TICKET_QUERY_INSERT = "INSERT INTO ticket(bookingTime,customerName, licensePlate,tripId) VALUES (?,?,?,?)";
    public static final String TICKET_QUERY_UPDATE = "UPDATE ticket set bookingTime = ?,customerName = ?, licensePlate = ?,tripId = ? where ticketId = ?";
    public static final String TICKET_QUERY_REMOVE_BY_TICKETID = "DELETE FROM ticket WHERE ticketId = ?";
    public static final String TICKET_QUERY_GET_ALL_LICENSE_PLATE = "";
    public static final String SUCCESS = "success";
    public static final String FAIL = "failed";
}
