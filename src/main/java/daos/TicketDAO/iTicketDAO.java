package daos.TicketDAO;

import entities.Ticket;

import java.sql.SQLException;
import java.util.List;

public interface iTicketDAO {
    List<Ticket> getAllTicket() throws SQLException;

    boolean insertTicket(Ticket ticket) throws SQLException;

    Ticket getTicketByTicketId(String ticketId) throws SQLException;

//    boolean updateTicket(Ticket ticket) throws SQLException;

    boolean removeTicketByTicketId(String ticketId) throws SQLException;

    String getTripIdByTicketId(String ticketId) throws SQLException;
}
