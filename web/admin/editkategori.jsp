<%-- 
    Document   : addkategori
    Created on : 14 Mei 13, 14:32:23
    Author     : Berty Tobing
--%>

<%@page import="ModelClass.MenuModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Category"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String del = request.getParameter("delete");
    
    if (del != null) {
        CategoryModel mod = new CategoryModel();
        mod.deleteKategori(Integer.parseInt(del));
        response.sendRedirect("vieweditkategori.jsp");
    }
%>

<div id ="daftar">
    <h3>Ubah kategori</h3>
    <br/>
    <br/>
    <form action="addkategori.jsp" method="post">
        <table>
            <%
                CategoryModel mod = new CategoryModel();
                ArrayList<Category> xx = mod.getCategory();
                int N = xx.size();
                
                for (int i = 0; i < N; ++i) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(xx.get(i).getName());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println("<form action='viewupdatekategori.jsp?update=" + xx.get(i).getId() + "' method='post'>");
                    out.println("<input type='image' name='updating' value='updating' src='../assets/update.png' />");
                    out.println("</form>");
                    out.println("</td>");
                    
                    
                    out.println("<td>");
                    out.println("<form action='editkategori.jsp?delete=" + xx.get(i).getId() + "' method='post'>");
                    out.println("<input type='image' name='deleting' value='deleting' src='../assets/delete.png' />");
                    out.println("</form>");
                    out.println("</td>");
                    
                    out.println("</tr>");
                }
            %>
        </table>
    </form>
</div>
