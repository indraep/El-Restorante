<%-- 
    Document   : sidebar
    Created on : May 4, 2013, 9:43:27 AM
    Author     : indraep
--%>

<%@page import="Bean.Category"%>
<%@page import="Bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModelClass.CategoryModel"%>
<div id="sidebar">
    <%
        CategoryModel categoryModel = new CategoryModel();
        ArrayList<Category> category = categoryModel.getCategory();
    %>
    
    <h4>Category</h4>
    <ul id="list_category">
        <%
            for (int i = 0; i < category.size(); i++) {
                out.print("<li>" + category.get(i).getName()+ "</li>");
            }
        %>
    </ul>
</div>
