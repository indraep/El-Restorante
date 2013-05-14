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
    String kategori = request.getParameter("kategori");
    String nama = request.getParameter("food_name");
    String harga = request.getParameter("food_price");
    String deskripsi = request.getParameter("food_description");

    if (kategori != null && kategori.length() > 0 && nama != null && nama.length() > 0 && harga != null && harga.length() > 0 && deskripsi != null && deskripsi.length() > 0) {
        MenuModel menu = new MenuModel();
        menu.updateMenu(kategori, nama, harga, deskripsi, idMenu);
        response.sendRedirect("index.jsp");
    }
    else {
        response.sendRedirect("vieweditmenu.jsp?id=" + idMenu + "&idx=" + idx);
    }

    MenuModel model = new MenuModel();
    Menu menu = model.getMenuById(idMenu);
%>

<div id ="daftar">
    <h3>Ubah menu</h3>
    <br/>
    <br/>
    <form action="editmenu.jsp" method="post">
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
                <td colspan="2"><input type="file" name ="food_img"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="image" name="editMenu" value="edit" src="../assets/savechanges.png" id ="logbutton" />
                    <input type="hidden" name="id" value="<%= idMenu%>"/>
                    <input type="hidden" name="idx" value="<%= idx%>"/>
                </td>
                <td><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
            </tr>

        </table>
    </form>
</div>
