package daos.ParkingLotDAO;

import entities.ParkingLot;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ParkingLotDAOImpl implements iParkingLotDAO {
    @Override
    public List<ParkingLot> getAllParkingLot() throws SQLException {

        try (Connection connection = DBUtils.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_GET_ALL)) {
            ResultSet rs = preparedStatement.executeQuery();
            List<ParkingLot> parkingLotList = new ArrayList<>();
            while (rs.next()) {
                ParkingLot lot = ParkingLot.builder()
                        .parkId(rs.getInt("parkId"))
                        .parkName(rs.getString("parkName"))
                        .parkPlace(rs.getString("parkPlace"))
                        .parkArea(rs.getDouble("parkArea"))
                        .parkPrice(rs.getDouble("parkPrice"))
                        .parkStatus(rs.getString("parkStatus"))
                        .build();
                parkingLotList.add(lot);
            }
            return parkingLotList;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public List<String> getAllParkingPlace() throws SQLException {
        try (Connection connection = DBUtils.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_PLACE)) {
            ResultSet rs = preparedStatement.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                list.add(rs.getString("parkPlace"));

            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException();
        }
}


    @Override
    public ParkingLot getParkingLotById(int id) throws SQLException {
        try {
            Connection connection = DBUtils.getInstance().getConnection();
            PreparedStatement preparedStatement =
                    connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_GET_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ParkingLot parkingLot = ParkingLot.builder()
                        .parkId(resultSet.getInt("parkId"))
                        .parkName(resultSet.getString("parkName"))
                        .parkPlace(resultSet.getString("parkPlace"))
                        .parkArea(resultSet.getDouble("parkArea"))
                        .parkPrice(resultSet.getDouble("parkPrice"))
                        .parkStatus(resultSet.getString("parkStatus"))
                        .build();
                return parkingLot;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            throw new SQLException();
        }
    }


    @Override
    public boolean deleteParkingLot(int id) throws SQLException {
        try (Connection connection = DBUtils.getInstance().getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_DELETE_BY_ID);) {
            preparedStatement.setInt(1, id);
            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                return true;
            }
            return false;
        } catch (
                Exception e) {
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public boolean addParkingLot(ParkingLot parkingLot) throws SQLException {
        try (Connection connection = DBUtils.getInstance().getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_ADD);) {
            preparedStatement.setDouble(1, parkingLot.getParkArea());
            preparedStatement.setString(2, parkingLot.getParkName());
            preparedStatement.setString(3, parkingLot.getParkPlace());
            preparedStatement.setDouble(4, parkingLot.getParkPrice());
            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                return true;
            }
            return false;

        } catch (
                Exception e) {
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public boolean updateParkingLot(ParkingLot parkingLot) throws SQLException {
        try (Connection connection = DBUtils.getInstance().getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_EDIT_BY_ID);) {
            preparedStatement.setDouble(1, parkingLot.getParkArea());
            preparedStatement.setString(2, parkingLot.getParkName());
            preparedStatement.setString(3, parkingLot.getParkPlace());
            preparedStatement.setDouble(4, parkingLot.getParkPrice());
            preparedStatement.setString(5, parkingLot.getParkStatus());
            preparedStatement.setInt(6, parkingLot.getParkId());
            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                return true;
            }
            return false;

        } catch (
                Exception e) {
            e.printStackTrace();
            throw new SQLException();
        }
    }

    @Override
    public List<ParkingLot> search(String search, String criteria) throws SQLException {
        List<ParkingLot> parkingLotList = new ArrayList<>();

        try (Connection connection = DBUtils.getInstance().getConnection()) {
            PreparedStatement preparedStatement = null;

            if (criteria.equals("name")) preparedStatement = connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_BY_PARKING_NAME);
            if (criteria.equals("place")) preparedStatement = connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_BY_PARKING_PLACE);
            if (criteria.equals("area")) preparedStatement = connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_BY_PARKING_AREA);
            if (criteria.equals("price")) preparedStatement = connection.prepareStatement(ParkingLotDAOCons.PARKING_LOT_QUERY_BY_PARKING_PRICE);
            preparedStatement.setString(1, search);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                ParkingLot lot = ParkingLot.builder()
                        .parkId(rs.getInt("parkId"))
                        .parkName(rs.getString("parkName"))
                        .parkPlace(rs.getString("parkPlace"))
                        .parkArea(rs.getDouble("parkArea"))
                        .parkPrice(rs.getDouble("parkPrice"))
                        .parkStatus(rs.getString("parkStatus"))
                        .build();
                parkingLotList.add(lot);
            }
            return parkingLotList;
        } catch (Exception e) {
            e.printStackTrace();
            throw new SQLException();
        }
    }
}
