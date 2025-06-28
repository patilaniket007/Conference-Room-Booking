package controller;

import dao.BookingDAO;
import model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session and user check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int userId = (int) session.getAttribute("userId");
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            LocalDate bookingDate = LocalDate.parse(request.getParameter("date"));
            LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
            LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));

            // Conflict check
            boolean isConflict = bookingDAO.isBookingConflict(roomId, bookingDate, startTime, endTime);
            if (isConflict) {
                request.setAttribute("error", "❌ Booking conflict! The room is already booked for the selected time.");
                request.getRequestDispatcher("searchRooms.jsp").forward(request, response);
                return;
            }

            // Booking creation
            Booking booking = new Booking();
            booking.setUserId(userId);
            booking.setRoomId(roomId);
            booking.setBookingDate(bookingDate);
            booking.setStartTime(startTime);
            booking.setEndTime(endTime);

            boolean success = bookingDAO.insertBooking(booking);

            if (success) {
                response.sendRedirect("myBookings.jsp");
            } else {
                request.setAttribute("error", "❌ Failed to create booking. Please try again.");
                request.getRequestDispatcher("searchRooms.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Error: " + e.getMessage());
            request.getRequestDispatcher("searchRooms.jsp").forward(request, response);
        }
    }
}
