<%-- 
    Document   : addmenu
    Created on : 13-May-2013, 18:46:30
    Author     : cLienT
--%>

<%@page import="Bean.Menu"%>
<%@page import="ModelClass.MenuModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Category"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int idMenu = Integer.parseInt(request.getParameter("id"));
    int idx = Integer.parseInt(request.getParameter("idx"));
    MenuModel model = new MenuModel();
    Menu menu = model.getMenuById(idMenu);
%>

<div id ="daftar">
    <h3>Ubah menu</h3>
    <br/>
    <br/>
    <form action="../editMenuImage" method="post" enctype="multipart/form-data">
        <input type="hidden" name="oldId" value="<%= idMenu %>" />
        <table>
            <tr>
                <td width="250px">Nama:</td>
                <td colspan="2"><input type="text" name="food_name" value="<%= menu.getName() %>"></td>
            </tr>
            <tr>
                <td>ID Kategori:</td>
                <td colspan="2">
                    <%
                        CategoryModel cat = new CategoryModel();
                        ArrayList<Category> kate = cat.getCategory();
                        out.print("<select name='kategori'>");
                        for (int i = 0; i < kate.size(); ++i) {
                            if (kate.get(i).getId() == idx)
                                out.print("<option value='" + kate.get(i).getId() + "' selected='true'>" + kate.get(i).getName() + "</option>");
                            else
                                out.print("<option value='" + kate.get(i).getId() + "'>" + kate.get(i).getName() + "</option>");
                        }
                        out.print("</select>");
                    %>
                </td>
            </tr>
            <tr>
                <td>Harga:</td>
                <td colspan="2"><input type=number name="food_price" value="<%= menu.getPrice() %>"></td>
            </tr>
            <tr>
                <td>Deskripsi:</td>
                <td colspan="2"><input type="text" name="food_description" value="<%= menu.getDescription() %>"></td>
            </tr>
            <tr>
                <td>Gambar:</td>
                <td colspan="2"><input type="file" name ="file"></td>
            </tr>
            <tr>
                <td></td>
                <td style="padding-top: 20px"><input type="image" name="editMenu" value="edit" src="../assets/savechanges.png" id ="logbutton" />
                    <input type="hidden" name="id" value="<%= idMenu%>"/>
                    <input type="hidden" name="idx" value="<%= idx%>"/>
                </td>
                <td style="padding-top: 20px"><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
            </tr>

        </table>
    </form>
</div>
