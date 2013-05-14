<%-- 
    Document   : logout
    Created on : 14 Mei 13, 19:29:55
    Author     : Berty Tobing
--%>

<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("usernameadmin")) {
                cookies[i] = new Cookie("usernameadmin", null);
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
        }
        response.sendRedirect("index.jsp?logged_out=true");
    }
%>
