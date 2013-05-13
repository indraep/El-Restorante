<%-- 
    Document   : menu
    Created on : May 11, 2013, 11:01:18 PM
    Author     : indraep
--%>

<%@page import="ModelClass.MenuModel"%>
<%@page import="Bean.Menu"%>
<%@page import="ModelClass.CategoryModel"%>
<div>
    
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Menu menu = new MenuModel().getMenuById(id);
    %>
    
    <table>
        <tr>
            <td>
                <div style="width: 130px; height: 130px; background-color: white">
                    <image src='' alt="<%= menu.getName() %>" height='130px' width='130px'/>
                </div>
            </td>
            <td rowspan="2">
                <div style="width: 130px; height: 200px; background-color: green">
                    <a href="<%= "show_menu_detail.jsp?id=" + menu.getId() %>" style="color: black"><%= menu.getName() %></a><br>
                    <%= menu.getDescription().length() <= 97 ? menu.getDescription() : menu.getDescription().substring(0, 97) + "..." %><br>
                    <%= menu.getPrice() %>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 130px; height: 70px; background-color: blue">
                    ADD TO CART
                </div>
            </td>
        </tr>
    </table>
</div>
