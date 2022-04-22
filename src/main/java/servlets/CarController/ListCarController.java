package servlets.CarController;

import daos.CarDAO.CarDAO;
import daos.CarDAO.CarDAOimp;
import entities.Car;
import utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/listCar")
public class ListCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CarDAO carDAO = new CarDAOimp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String indexPage = req.getParameter("index");
            if(indexPage == null){
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            int numberOfCars = carDAO.getNumberOfCars();
            int pageSize = Constants.PAGE_SIZE_CAR;
            int endPage = numberOfCars / pageSize;
            if(numberOfCars % pageSize != 0){
                endPage++;
            }
            List<Car> list = carDAO.pagingCar(index);
            req.setAttribute("listCars",list);
            req.setAttribute("end",endPage);
            req.getRequestDispatcher("views/CarJSP/listCar.jsp").forward(req,resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
