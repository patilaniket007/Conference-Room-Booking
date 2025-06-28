package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Room;
import util.DBUtil;

public class RoomDAO {

    // Get all rooms
    public List<Room> getAllRooms() {
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM rooms";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setCapacity(rs.getInt("capacity"));
                room.setProjector(rs.getBoolean("projector"));
                room.setWhiteboard(rs.getBoolean("whiteboard"));
                roomList.add(room);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomList;
    }

    // Add a new room
    public boolean addRoom(Room room) {
        String sql = "INSERT INTO rooms (name, capacity, projector, whiteboard) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, room.getName());
            ps.setInt(2, room.getCapacity());
            ps.setBoolean(3, room.isProjector());
            ps.setBoolean(4, room.isWhiteboard());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get room by ID
    public Room getRoomById(int id) {
        String sql = "SELECT * FROM rooms WHERE id = ?";
        Room room = null;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setCapacity(rs.getInt("capacity"));
                room.setProjector(rs.getBoolean("projector"));
                room.setWhiteboard(rs.getBoolean("whiteboard"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return room;
    }

    // Update room details
    public boolean updateRoom(Room room) {
        String sql = "UPDATE rooms SET name = ?, capacity = ?, projector = ?, whiteboard = ? WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, room.getName());
            ps.setInt(2, room.getCapacity());
            ps.setBoolean(3, room.isProjector());
            ps.setBoolean(4, room.isWhiteboard());
            ps.setInt(5, room.getId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete room
    public boolean deleteRoom(int id) {
        String sql = "DELETE FROM rooms WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
