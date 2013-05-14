<%-- 
    Document   : login
    Created on : 13 Mei 13, 10:58:17
    Author     : Berty Tobing
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Bean.User"%>
<%@page import="ModelClass.UserModel"%>
<%@page import="java.util.*"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String usernames = null;
    if (cookies != null && cookies.length != 0) {
        for (int i = 0; i < cookies.length; i++)
            if (cookies[i].getName().equals("usernameadmin"))
                usernames = cookies[i].getValue();
    }
    
    if (usernames != null) {
        response.sendRedirect("index.jsp");
    }
    
    UserModel userModel = new UserModel();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username != null && password != null && username.length() > 0 && password.length() > 0) {
        User user = userModel.login(username, password, 1);
        if (user != null) {
            Cookie cookie = new Cookie("usernameadmin", username);
            response.addCookie(cookie);
            response.sendRedirect("index.jsp");
        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../style/el_restorante_style.css">
        <title>Login/Register</title>
    </head>
    <body>

        <table id="mainLogin">
            <tr>
                <td>
                    <jsp:include page = 'banner.jsp' flush = 'true' />
                </td>
            </tr>
            <tr id ="login">
                <td>
            <center><h3>ADMIN</h3></center>
            <center><jsp:include page = 'loginadmin.jsp' flush = 'true' /></center>
        </td>
    </tr>
</table>
</body>
</html>
