<%-- 
    Document   : sidebar
    Created on : May 4, 2013, 9:43:27 AM
    Author     : indraep
--%>

<%@page import="Bean.Category"%>
<%@page import="Bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModelClass.CategoryModel"%>

<script>
    var toggle = function() {
        var mydiv = document.getElementById('newpost');
        if (mydiv.style.display === 'block' || mydiv.style.display === '')
            mydiv.style.display = 'none';
        else
            mydiv.style.display = 'block'
    }
</script>

<div id="right_sidebar">
    <%
        String loggedOut = request.getParameter("logged_out");
        if (loggedOut != null && loggedOut.equals("true")) {
            out.print("<script>clearCart();</script>");
        }
    %>
    <p><img src="assets/cart.png" width="30px" height="30px"/></p>
    <center><p><img src="assets/cart.png" width="30px" height="30px"/></p></center>

    <div id="cart">
    </div>
</div>
