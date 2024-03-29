

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
            if (cookies[i].getName().equals("username"))
                usernames = cookies[i].getValue();
    }
    
    if (usernames != null) {
        response.sendRedirect("index.jsp");
    }
    
    UserModel userModel = new UserModel();
    UserModel userModel2 = new UserModel();

    String reg = request.getParameter("register");

    if (reg == null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null && username.length() > 0 && password.length() > 0) {
            User user = userModel.login(username, password, 0);
            if (user != null) {
                Cookie cookie = new Cookie("username", username);
                response.addCookie(cookie);
                response.sendRedirect("index.jsp");
            }
        }
    } else {
        String nama = request.getParameter("namereg");
        String username = request.getParameter("usernamereg");
        String password = request.getParameter("passwordreg");
        String email = request.getParameter("emailreg");
        String alamat = request.getParameter("alamatreg");
        String birthday = request.getParameter("birthdatereg");
        String status = request.getParameter("statusreg");
        //out.println(nama + " " + username + " " + password + " " + alamat + " " + email + " " + birthday + " " + status);
        if (nama == null || nama.length() == 0) {
            out.println("<script>alert('Harap lengkapi nama Anda!');</script>");
        } else if (username == null || username.length() == 0) {
            out.println("<script>alert('Harap lengkapi username Anda');</script>");
        } else if (password == null || password.length() == 0) {
            out.println("<script>alert('Harap lengkapi password Anda');</script>");
        } else if (email == null || email.length() == 0) {
            out.println("<script>alert('Harap lengkapi email Anda');</script>");
        } else if (alamat == null || alamat.length() == 0) {
            out.println("<script>alert('Harap lengkapi alamat Anda');</script>");
        } else if (birthday == null || birthday.length() == 0) {
            out.println("<script>alert('Harap lengkapi birthday Anda');</script>");
        } else if (status == null || status.length() == 0) {
            out.println("<script>alert('Harap lengkapi status Anda');</script>");
        } else {

            out.println(nama + " " + username + " " + password + " " + alamat + " " + email + " " + birthday + " " + status);
            User user2 = new User(nama, username, password, alamat, email, birthday, status);

            int bedaUsia = Integer.parseInt(user2.getUsia());
            out.println(bedaUsia);

            if (bedaUsia < 0) {
                out.println("<script>alert('Usia Anda melebihi batas normal');</script>");
            } else {
                boolean registered = userModel2.register(nama, username, password, email, alamat, birthday, status);
                if (registered) {
                    out.println("<script>alert('Data Anda berhasil disimpan!');</script>");
                } else {
                    out.println("<script>alert('Username sudah ada!');</script>");
                }
            }
        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/el_restorante_style.css">
        <title>Login/Register</title>
    </head>
    <body>

        <table id="mainLogin">
            <tr>
                <td colspan="2">
                    <jsp:include page = 'banner.jsp' flush = 'true' />
                </td>
            </tr>
            <tr id ="login">
                <td>
                    <jsp:include page ='slider.jsp' flush = 'true' />
                </td>
                <td>
                    <jsp:include page = 'loginregister.jsp' flush = 'true' />
                </td>
            </tr>
        </table>
    </body>
</html>
