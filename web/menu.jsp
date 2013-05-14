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
            <td>
                <div style="width: 130px; height: 130px; background-image: url(assets/description_bg2.png)">
                    <center><a href="<%= "show_menu_detail.jsp?id=" + menu.getId() %>" style="color: black"><%= menu.getName() %></a><br>
                    <%= menu.getDescription().length() <= 40 ? menu.getDescription() : menu.getDescription().substring(0, 40) + "..." %><br>
                    </center>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 130px; height: 30px">
                    <%
                        String link = "javascript:addToCart('(" + menu.getId() + "," + menu.getName() + ")')";
                    %>
                    <center><a href="<%= link %>"><img src="assets/addtocart.png"/></a></center>
                </div>
            </td>
            <td>
                <div style="width: 130px; height: 30px; background-image: url(assets/price_bg.png)">
                    <center><strong>Rp.<%= menu.getPrice() %></strong></center>
                </div>
            </td>
        </tr>
    </table>
</div>
