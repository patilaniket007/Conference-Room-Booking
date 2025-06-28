package controller;

import dao.BookingDAO;
import dao.RoomDAO;
import model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AvailableRoomsServlet")
public class AvailableRoomsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final RoomDAO roomDAO = new RoomDAO();
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String dateParam = request.getParameter("date");
            String startParam = request.getParameter("startTime");
            String endParam = request.getParameter("endTime");

            if (dateParam == null || startParam == null || endParam == null) {
                request.setAttribute("error", "❌ All fields are required.");
                request.getRequestDispatcher("searchRooms.jsp").forward(request, response);
                return;
            }

            LocalDate date = LocalDate.parse(dateParam);
            LocalTime startTime = LocalTime.parse(startParam);
            LocalTime endTime = LocalTime.parse(endParam);

            List<Room> allRooms = roomDAO.getAllRooms();
            List<Room> availableRooms = new ArrayList<>();

            for (Room room : allRooms) {
                boolean conflict = bookingDAO.isBookingConflict(room.getId(), date, startTime, endTime);
                if (!conflict) {
                    availableRooms.add(room);
                }
            }

            request.setAttribute("availableRooms", availableRooms);
            request.setAttribute("date", date.toString());
            request.setAttribute("startTime", startTime.toString());
            request.setAttribute("endTime", endTime.toString());

            request.getRequestDispatcher("searchRooms.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Error: " + e.getMessage());
            request.getRequestDispatcher("searchRooms.jsp").forward(request, response);
        }
    }
}
