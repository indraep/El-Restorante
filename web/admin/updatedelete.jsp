<%-- 
    Document   : updatedelete
    Created on : 14 Mei 13, 15:12:01
    Author     : Berty Tobing
--%>

<%@page import="ModelClass.MenuModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String status[] = request.getParameter("status").split(" ");
    if (status[0].equals("update")) {
        String id = status[1];
        String idx = status[2];
        response.sendRedirect("vieweditmenu.jsp?id=" + id + "&idx=" + idx);
    }
    else if (status[0].equals("delete")) {
        String id = status[1];
        MenuModel menu = new MenuModel();
        menu.deleteMenu(id);
        response.sendRedirect("index.jsp");
    }
    else {
        
    }
%>
