package controller;

import dao.RoomDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {
    private final RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        roomDAO.deleteRoom(id);

        response.sendRedirect("manageRooms.jsp");
    }
}
