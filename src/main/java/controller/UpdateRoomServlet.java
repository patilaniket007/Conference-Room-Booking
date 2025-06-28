// UpdateRoomServlet.java content
package controller;

import dao.RoomDAO;
import model.Room;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {
    private final RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        boolean projector = request.getParameter("projector") != null;
        boolean whiteboard = request.getParameter("whiteboard") != null;

        Room room = new Room(id, name, capacity, projector, whiteboard);
        roomDAO.updateRoom(room);

        response.sendRedirect("manageRooms.jsp");
    }
}
