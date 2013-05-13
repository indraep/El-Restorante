<%-- 
    Document   : banner
    Created on : May 4, 2013, 10:12:07 AM
    Author     : indraep
--%>

<script>
    $('.menu').click(function() {
        $(this).next('.a_menu').show();
    });
    $('body, .a_menu a').click(function() {
        $('.a_menu').hide();
    });
</script>

<div id="banner">
    <%
        Cookie[] cookies = request.getCookies();
        String name = null;
        if (cookies != null && cookies.length != 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("username")) {
                    name = cookies[i].getValue();
                }
            }
        }
        
        if (name != null)
            out.print("Hello " + name);
    %>
    <nav>
        <ul class="dropdown_user">
            <li class="drop">
                <a class="drop_anchor" href="#"><img src = "assets/menu.png" /></a>
                <div class="dropdownContain">
                    <div class="dropOut">
                        <div class="triangle"></div>
                        <ul class="dropdown_user">
                            <li><a class="edit_anchor" href ="edit.jsp">Edit Profile</a></li>
                            <li>View History</li>
                            <li>About</li>
                            <li><a class="login_anchor" href ="login.jsp">Login</a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </nav>
</div>