package controller;

import dao.RoomDAO;
import model.Room;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    private final RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        boolean projector = request.getParameter("projector") != null;
        boolean whiteboard = request.getParameter("whiteboard") != null;

        Room room = new Room();
        room.setName(name);
        room.setCapacity(capacity);
        room.setProjector(projector);
        room.setWhiteboard(whiteboard);

        try {
            roomDAO.addRoom(room);
            response.sendRedirect("manageRooms.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Failed to add room: " + e.getMessage());
            request.getRequestDispatcher("addRoom.jsp").forward(request, response);
        }
    }
}
