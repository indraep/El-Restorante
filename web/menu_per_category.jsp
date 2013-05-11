<%-- 
    Document   : daftar
    Created on : 09 Mei 13, 11:53:46
    Author     : Berty Tobing
--%>

<%@page import="Bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModelClass.CategoryModel"%>

<div id = "daftar">
    
    <%
        CategoryModel categoryModel = new CategoryModel();
        String catId = request.getParameter("categoryId");
        int categoryId = catId == null ? 1 : Integer.parseInt(catId);
        ArrayList<Menu> menu = categoryModel.getMenuByCategory(categoryId);
        String link = "";
    %>
    
    <h3>Daftar Menu <%= categoryModel.getCategoryName(categoryId) %> </h3>
    <%
        out.print("<table>");
        for (int i = 0; i < 3; ++i) {
            out.print("<tr>");
                for (int j = 0; j < 3; j++) {
                    out.print("<td>"); %>
                        <% if (3 * i + j < menu.size()) {
                            int id = menu.get(3*i+j).getId();
                            link = "menu.jsp?id=" + id;
                        %>
                            <jsp:include page="<%= link %>" flush="true" />	
                        <% } %>
                    <%out.print("</td>");
                }
            out.print("</tr>");
        }
        out.print("</table>");
    %>
</div>
