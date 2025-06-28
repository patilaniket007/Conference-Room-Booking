package dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import model.Booking;
import util.DBUtil;

public class BookingDAO {

    public boolean isBookingConflict(int roomId, LocalDate date, LocalTime startTime, LocalTime endTime) {
        String sql = "SELECT * FROM bookings WHERE room_id = ? AND booking_date = ? AND (start_time < ? AND end_time > ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, roomId);
            ps.setDate(2, Date.valueOf(date));
            ps.setTime(3, Time.valueOf(endTime));
            ps.setTime(4, Time.valueOf(startTime));

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }

    public boolean insertBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, room_id, booking_date, start_time, end_time) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getRoomId());
            ps.setDate(3, Date.valueOf(booking.getBookingDate()));
            ps.setTime(4, Time.valueOf(booking.getStartTime()));
            ps.setTime(5, Time.valueOf(booking.getEndTime()));

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // ✅ Method to get all bookings (Admin Panel)
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT b.booking_id, b.user_id, u.username, b.room_id, r.name AS room_name, " +
                     "b.booking_date, b.start_time, b.end_time " +
                     "FROM bookings b " +
                     "JOIN users u ON b.user_id = u.id " +
                     "JOIN rooms r ON b.room_id = r.id " +
                     "ORDER BY b.booking_date DESC, b.start_time ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setUsername(rs.getString("username"));
                booking.setRoomId(rs.getInt("room_id"));
                booking.setRoomName(rs.getString("room_name"));
                booking.setBookingDate(rs.getDate("booking_date").toLocalDate());
                booking.setStartTime(rs.getTime("start_time").toLocalTime());
                booking.setEndTime(rs.getTime("end_time").toLocalTime());

                list.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ New: Get bookings by user (for myBookings.jsp)
    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT b.booking_id, b.room_id, r.name AS room_name, " +
                     "b.booking_date, b.start_time, b.end_time " +
                     "FROM bookings b " +
                     "JOIN rooms r ON b.room_id = r.id " +
                     "WHERE b.user_id = ? " +
                     "ORDER BY b.booking_date DESC, b.start_time ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("booking_id"));
                booking.setUserId(userId);
                booking.setRoomId(rs.getInt("room_id"));
                booking.setRoomName(rs.getString("room_name"));
                booking.setBookingDate(rs.getDate("booking_date").toLocalDate());
                booking.setStartTime(rs.getTime("start_time").toLocalTime());
                booking.setEndTime(rs.getTime("end_time").toLocalTime());

                list.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
