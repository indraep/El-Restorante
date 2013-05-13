<%-- 
    Document   : sidebar
    Created on : May 4, 2013, 9:43:27 AM
    Author     : indraep
--%>

<%@page import="Bean.Category"%>
<%@page import="Bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModelClass.CategoryModel"%>

<script>
    var toggle = function() {
        var mydiv = document.getElementById('newpost');
        if (mydiv.style.display === 'block' || mydiv.style.display === '')
            mydiv.style.display = 'none';
        else
            mydiv.style.display = 'block'
    }
</script>

<div id="sidebar">
    <h4>Category</h4>

    <%
        CategoryModel categoryModel = new CategoryModel();
        ArrayList<Category> category = categoryModel.getCategory();
        for (int i = 0; i < category.size(); i++) {
    %>
        <a class="category" href="<%= "index.jsp?categoryId=" + category.get(i).getId()%>"><%= category.get(i).getName()%></a><br/>
    <%
        }
    %>
    <br/>
    <form method="get" action="index.jsp"> 
        <table cellpadding="0px" cellspacing="0px"> 
            <tr> 
                <td style="border-style:solid none solid solid;border-color:#ff9900;border-width:1px;">
                    <input type="text" name="zoom_query" style="width:100px; border:0px solid; height:17px; padding:0px 3px; position:relative;"> 
                </td>
                <td style="border-style:solid;border-color:#ff9900;border-width:1px;"> 
                    <input type="submit" value="" style="border-style: none; background: url(assets/searchbutton.png) no-repeat; width: 25px; height: 25px;">
                </td>
            </tr>

        </table>
    </form>
</div>
