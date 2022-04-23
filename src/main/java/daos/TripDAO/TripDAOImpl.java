package daos.TripDAO;

import entities.Trip;
import utils.DBUtils;
import utils.DateUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TripDAOImpl implements iTripDAO {
    @Override
    public List<Trip> getAllTrip() throws SQLException {
        List<Trip> tripList = new ArrayList<>();
        try (Connection connection = DBUtils.getInstance().getConnection();
             PreparedStatement pstm = connection.prepareStatement(TripDAOCons.TRIP_QUERY_GET_ALL)) {
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt("tripId"))
                        .bookedTicketNumber(rs.getInt("bookedTicketNumber"))
                        .carType(rs.getString("carType"))
                        .departureDate(rs.getDate("departureDate"))
                        .departureTime(rs.getTime("departureTime"))
                        .destination(rs.getString("destination"))
                        .driver(rs.getString("driver"))
                        .maximumOnlineTicketNumber(rs.getInt("maximumOnlineTicketNumber"))
                        .build();
                tripList.add(trip);
            }
            return tripList;
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public boolean insertTrip(Trip trip) throws SQLException {
        try(Connection connection = DBUtils.getInstance().getConnection();
        PreparedStatement pstm = connection.prepareStatement(TripDAOCons.TRIP_QUERY_INSERT)){
            pstm.setString(1,trip.getCarType());
            pstm.setDate(2, DateUtils.convertJavaDateToSqlDate(trip.getDepartureDate()));
            pstm.setTime(3,DateUtils.convertJavaDateToSQLTime(trip.getDepartureTime()));
            pstm.setString(4,trip.getDestination());
            pstm.setString(5,trip.getDriver());
            pstm.setInt(6,trip.getMaximumOnlineTicketNumber());
            int n = pstm.executeUpdate();
            return n > 0;
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public Trip getTripByTripId(String tripId) throws SQLException {
        try(Connection connection = DBUtils.getInstance().getConnection();
        PreparedStatement pstm = connection.prepareStatement(TripDAOCons.TRIP_QUERY_GET_BY_TRIPID)){
            pstm.setString(1,tripId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()){
                return Trip.builder()
                        .tripId(rs.getInt("tripId"))
                        .bookedTicketNumber(rs.getInt("bookedTicketNumber"))
                        .carType(rs.getString("carType"))
                        .departureDate(rs.getDate("departureDate"))
                        .departureTime(rs.getTime("departureTime"))
                        .destination(rs.getString("destination"))
                        .driver(rs.getString("driver"))
                        .maximumOnlineTicketNumber(rs.getInt("maximumOnlineTicketNumber"))
                        .build();
            }
            return null;
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public boolean updateTrip(Trip trip) throws SQLException {
        try(Connection connection = DBUtils.getInstance().getConnection();
            PreparedStatement pstm = connection.prepareStatement(TripDAOCons.TRIP_QUERY_UPDATE)){
            pstm.setString(1,trip.getCarType());
            pstm.setDate(2, DateUtils.convertJavaDateToSqlDate(trip.getDepartureDate()));
            pstm.setTime(3,DateUtils.convertJavaDateToSQLTime(trip.getDepartureTime()));
            pstm.setString(4,trip.getDestination());
            pstm.setString(5,trip.getDriver());
            pstm.setInt(6,trip.getMaximumOnlineTicketNumber());
            pstm.setInt(7,trip.getTripId());
            int n = pstm.executeUpdate();
            return n > 0;
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public boolean removeTripByTripId(String tripId) throws SQLException {
        try(Connection connection = DBUtils.getInstance().getConnection();
        PreparedStatement pstm = connection.prepareStatement(TripDAOCons.TRIP_QUERY_REMOVE_BY_TRIPID)){
            pstm.setString(1,tripId);
            int n = pstm.executeUpdate();
            return n > 0;
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public String getDestinationByTripId(String tripId) throws SQLException {
        try(Connection connection = DBUtils.getInstance().getConnection();
        PreparedStatement pstm = connection.prepareStatement(TripDAOCons.TRIP_QUERY_GET_DESTINATION_BY_TRIPID)){
            pstm.setString(1,tripId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()){
                return rs.getString("destination");
            }else{
                return null;
            }
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public boolean updateBookedTicketByTripId(String tripId, int number) throws SQLException {
        return false;
    }

    public static void main(String[] args) {
        iTripDAO tripDAO = new TripDAOImpl();
        try {
//            Trip trip = tripDAO.getTripByTripId("99");
            System.out.println(tripDAO.getDestinationByTripId("8"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        try {
//            Trip trip = Trip.builder()
//                    .carType("TEST")
//                    .departureDate(DateUtils.convertStringToDate("12/03/2022"))
//                    .departureTime(DateUtils.convertStringToTime("22:33 AM"))
//                    .destination("TEST DESTINATION")
//                    .driver("TEST DRIVER")
//                    .maximumOnlineTicketNumber(999)
//                    .build();
//            boolean b = tripDAO.insertTrip(trip);
//            System.out.println(b);
//        } catch (SQLException e) {
//            System.out.println("ERROR");
//        } catch (ParseException e) {
//            e.printStackTrace();
//            System.out.println("KO PARSE DUOC");
//        }

//        String time = "23:32";
//        try {
//            System.out.println(DateUtils.convertStringToTime(time));
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

//        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
//        Date date = null;
//        try {
//            date = formatter.parse(time);
//            String sql = "UPDATE trip SET departureTime = ? WHERE tripId = ?";
//            try(Connection connection = DBUtils.getInstance().getConnection();
//            PreparedStatement pstm = connection.prepareStatement(sql)){
//                Time t = new Time(date.getTime());
//                pstm.setTime(1,t);
//                pstm.setInt(2,15);
//                pstm.executeUpdate();
//
//            }
//        } catch (ParseException | SQLException e) {
//            e.printStackTrace();
//            System.out.println("Khong parse duoc");
//        }
    }
}
