/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ShoppingListServlet")
public class ShoppingListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("register")) {
            String username = request.getParameter("username");
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("items", new ArrayList<String>());
            response.sendRedirect("shoppingList.jsp");
        } else if (action != null && action.equals("addItem")) {
            HttpSession session = request.getSession();
            String item = request.getParameter("item");
            @SuppressWarnings("unchecked")
            ArrayList<String> items = (ArrayList<String>) session.getAttribute("items");
            items.add(item);
            response.sendRedirect("shoppingList.jsp");
        } else if (action != null && action.equals("deleteItem")) {
            HttpSession session = request.getSession();
            String item = request.getParameter("item");
            @SuppressWarnings("unchecked")
            ArrayList<String> items = (ArrayList<String>) session.getAttribute("items");
            items.remove(item);
            response.sendRedirect("shoppingList.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
