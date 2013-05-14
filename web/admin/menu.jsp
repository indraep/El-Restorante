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
                <div style="width: 130px; height: 130px; background-image: url(../assets/description_bg.png)">
                    <center><a href="<%= "show_menu_detail.jsp?id=" + menu.getId() %>" style="color: black"><%= menu.getName() %></a><br>
                    <%= menu.getDescription().length() <= 40 ? menu.getDescription() : menu.getDescription().substring(0, 40) + "..." %><br>
                    </center>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 130px; height: 30px">
                    <form action="updatedelete.jsp">
                    <center>
                        <input type="image" name="updating" value="updating" src="../assets/update.png" />
                        <input type="hidden" name="status" value="update <%= menu.getId() %> <%= menu.getCategoryId()%>" />
                    </center>
                    
                    </form>
                </div>
            </td>
            <td>
                <div style="width: 130px; height: 30px">
                    <form action="updatedelete.jsp">
                    <center>
                        <input type="image" name="deleting" value="deleting" src="../assets/delete.png" />
                        <input type="hidden" name="status" value="delete <%= menu.getId() %>" />
                    </center>
                    
                    </form>
                </div>
            </td>
        </tr>
    </table>
</div>
