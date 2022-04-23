package servlets.TicketController;

import daos.TicketDAO.TicketDAOCons;
import daos.TicketDAO.TicketDAOImpl;
import daos.TicketDAO.iTicketDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "TicketDeleteController", urlPatterns = "/ticket-delete")
public class TicketDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ticketId = req.getParameter("ticketId");
        if (ticketId == null || ticketId.trim().length() == 0) {
            //ERROR
        } else {
            iTicketDAO ticketDAO = new TicketDAOImpl();
            try {
                if (ticketDAO.removeTicketByTicketId(ticketId)){

                    req.setAttribute("message", TicketDAOCons.SUCCESS);
                    req.getRequestDispatcher("");
                }else{
                    //ERROR
                }
            } catch (SQLException e) {
                e.printStackTrace();
                //ERROR
            }
        }
    }
}
