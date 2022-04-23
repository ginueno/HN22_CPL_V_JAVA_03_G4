package servlets.CarController;

import daos.CarDAO.CarDAO;
import daos.CarDAO.CarDAOimp;
import entities.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/searchCar")
public class SearchCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CarDAO carDAO = new CarDAOimp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        try {
            String keyword = req.getParameter("keyword");
            String criteria = req.getParameter("criteria");
            req.setAttribute("keyword",keyword);
            req.setAttribute("criteria",criteria);
            List<Car> list;
            if (keyword.equals("")){
                 list = carDAO.getAll();
            }else {
                list = carDAO.search(keyword,criteria) ;
            }
            req.setAttribute("listCars",list);
            req.getRequestDispatcher("views/CarJSP/listCar.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
