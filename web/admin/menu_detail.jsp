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
    <h2><%= menu.getName() %> </h2>
    <% String src = "../uploaded-image/menu/" + menuModel.getImageName("" + menu.getId()); %>
    <img src="<%= src %>" alt="<%= menu.getName() %>" style="width: 480px; height: 360px;"/><br/><br/>
    <h4>Deskripsi</h4>
    <%= menu.getDescription() %><br/><br/>
    <h4>Harga</h4>
    <%= "Rp. " + menu.getPrice() %>
</div>
