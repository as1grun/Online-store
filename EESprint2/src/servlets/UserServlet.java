package servlets;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(value = "/profile")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email_user");
        String password = request.getParameter("password_user");

        ArrayList<Users> usersArrayList = DBConnector.getAllUser();

        for (int i = 0; i < usersArrayList.size(); i++) {
            if (Objects.equals(email, usersArrayList.get(i).getEmail()) && Objects.equals(password, usersArrayList.get(i).getPassword())){
                request.getRequestDispatcher("profile.jsp").forward(request,response);
            }
        }

        request.getRequestDispatcher("signIn.jsp").forward(request,response);

    }
}
