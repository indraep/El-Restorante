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
        out.print("<img src = 'assets/menu.png' id = 'menu' onclick='toggle();'>");
    %>




    <div id="newpost">
        <ul id ="show">
            <li><a href="index.jsp"/>Edit Profile</li>
            <li><a href="index.jsp"/>View Order History</li>
            <li><a href="index.jsp"/>About</li>
            <li><a href="login.jsp"/>Logout</li>
        </ul>
        <div id="menu">
            Login
        </div>
    </div>
