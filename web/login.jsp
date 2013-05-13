<%-- 
    Document   : login
    Created on : 13 Mei 13, 10:58:17
    Author     : Berty Tobing
--%>

<%@page import="Bean.User"%>
<%@page import="ModelClass.UserModel"%>
<%@page import="java.util.*"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    UserModel userModel = new UserModel();
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null && username.length() >0 && password.length() > 0) {
        User user = userModel.login(username, password);
        if (user != null) {
            Cookie cookie = new Cookie("username", username);
            response.addCookie(cookie);
            response.sendRedirect("index.jsp");
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/el_restorante_style.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table id="mainLogin">
            <tr>
                <td colspan="2">
                    <jsp:include page = 'banner.jsp' flush = 'true' />
                </td>
            </tr>
            <tr id ="login">
                <td width="80%">
                    Welcome to El-Restorante
                </td>
                <td>
                    <jsp:include page = 'loginregister.jsp' flush = 'true' />
                </td>
            </tr>
        </table>
    </body>
</html>
