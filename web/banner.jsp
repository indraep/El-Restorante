<%-- 
    Document   : banner
    Created on : May 4, 2013, 10:12:07 AM
    Author     : indraep
--%>

<div id="banner">
    <%
        String loggedOut = request.getParameter("logged_out");
        
        Cookie[] cookies = request.getCookies();
        String name = null;
        if (cookies != null && cookies.length != 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("username")) {
                    if (loggedOut != null && loggedOut.equals("true")) {
                        cookies[i].setMaxAge(0);
                        response.addCookie(cookies[i]);
                    }
                    else
                        name = cookies[i].getValue();
                }
            }
        }
    %>
        <nav>
            <ul class="dropdown_user">
                <li class="drop">
                    <a class="drop_anchor" href="#"><%= name == null? "" : name %><img src = "assets/menu.png" /></a>
                    <div class="dropdownContain">
                        <div class="dropOut">
                            <div class="triangle"></div>
                            <ul class="dropdown_user">
                                <% if (name != null) { %>
                                    <li><a class="edit_anchor" href ="edit.jsp">Edit Profile</a></li>
                                    <li><a class="edit_anchor" href ="orderhistory.jsp">View History</a></li>
                                <% } %>
                                <li><a class="edit_anchor" href ="aboutus.jsp">About</a></li>
                                <% if (name != null) { %>
                                    <li><a class="login_anchor" href ="index.jsp?logged_out=true">Logout</a></li>
                                <% } else {%>
                                    <li><a class="login_anchor" href ="login.jsp">Login</a></li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
</div>