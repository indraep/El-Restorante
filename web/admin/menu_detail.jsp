<%-- 
    Document   : food_detail.jsp
    Created on : May 13, 2013, 9:51:31 AM
    Author     : indraep
--%>

<%@page import="Bean.Menu"%>
<%@page import="ModelClass.MenuModel"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MenuModel menuModel = new MenuModel();
    Menu menu = menuModel.getMenuById(id);
%>

<div id="div_menu_detail">
    <h3><%= menu.getName() %> </h3>
    <% String src = "utilities/retrieve_menu_image.jsp?id=" + menu.getId(); %>
    <img src="<%= src %>" alt="<%= menu.getName() %>" style="width: 200px; height: 300px;"/>
    <h4>Deskripsi</h4>
    <%= menu.getDescription() %>
    <h4>Harga</h4>
    <%= "Rp. " + menu.getPrice() %>
</div>
