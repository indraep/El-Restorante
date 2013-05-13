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

        String spage = request.getParameter("page");
        int npage = spage == null ? 1 : Integer.parseInt(spage);

        ArrayList<Menu> menu = categoryModel.getMenuByCategory(categoryId, npage);
        String link = "";
    %>

    <h3>Daftar Menu <%= categoryModel.getCategoryName(categoryId)%> </h3>
    <%
        out.print("<table>");
        for (int i = 0; i < 3; ++i) {
            out.print("<tr>");
            for (int j = 0; j < 3; j++) {
                out.print("<td>");%>
                <% if (3 * i + j < menu.size()) {
                        int id = menu.get(3 * i + j).getId();
                        link = "menu.jsp?id=" + id;
                %>
                    <jsp:include page="<%= link%>" flush="true" />	
            <% }%>
            <%out.print("</td>");
            }
            out.print("</tr>");
        }
        out.print("</table>"); %>
        <ul class="pager">
            <li>
                <%
                    if (npage > 1) {
                        out.print("<a href='index.jsp?categoryId=" + categoryId + "&page=" + (npage - 1) + "'>Sebelumnya</a>");
                    }
                %>
            </li>
            <li>
                <%
                    if (menu.size() > 9) {
                        out.print("<a href='index.jsp?categoryId=" + categoryId + "&page=" + (npage + 1) + "'>Berikutnya</a>");
                    }
                %>
            </li>
        </ul>
</div>
