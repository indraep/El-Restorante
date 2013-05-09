<%-- 
    Document   : daftar
    Created on : 09 Mei 13, 11:53:46
    Author     : Berty Tobing
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModelClass.CategoryModel"%>

<div id = "daftar">
    <%
        CategoryModel categoryModel = new CategoryModel();
        ArrayList<String> category = categoryModel.getCategory();
    %>
    
    <h4>Daftar Menu</h4>
    <table>
        <%
            for (int i = 0; i < 3; ++i) {
                out.print("<tr>");
                for (int j = 0; j < 3; ++j) {
                    out.print("<td>");
                    out.print("OKKKKK");
                    out.print("</td>");
                }
                out.print("</tr>");
            }
        %>
    </table>
</div>
