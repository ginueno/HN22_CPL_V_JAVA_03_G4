package daos.TripDAO;

import entities.Trip;

import java.sql.SQLException;
import java.util.List;

public interface iTripDAO {
    List<Trip> getAllTrip() throws SQLException;
    boolean insertTrip(Trip trip) throws SQLException;
    Trip getTripByTripId(String tripId) throws SQLException;
    boolean updateTrip(Trip trip) throws SQLException;
    boolean removeTripByTripId(String tripId) throws SQLException;
}
