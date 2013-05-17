<%-- 
    Document   : addmenu
    Created on : 13-May-2013, 18:46:30
    Author     : cLienT
--%>

<%@page import="ModelClass.MenuModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Category"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>   
<%@ page import="java.io.*"%>   
<%@ page import="java.util.*"%>   

<div id ="daftar">
    <h3>Tambahkan menu</h3>

    <form action="../uploadMenuImage" method="post" enctype="multipart/form-data">
        <br/>
        <br/>
        <table>
            <tr>
                <td width="250px">Nama:</td>
                <td colspan="2"><input type="text" name="food_name"></td>
            </tr>
            <tr>
                <td>ID Kategori:</td>
                <td colspan="2">
                    <%
                        CategoryModel cat = new CategoryModel();
                        ArrayList<Category> kate = cat.getCategory();
                        out.print("<select name='kategori'>");
                        for (int i = 0; i < kate.size(); ++i) {
                            out.print("<option value='" + kate.get(i).getId() + "'>" + kate.get(i).getName() + "</option>");
                        }
                        out.print("</select>");
                    %>
                </td>
            </tr>
            <tr>
                <td>Harga:</td>
                <td colspan="2"><input type=number name="food_price"></td>
            </tr>
            <tr>
                <td>Deskripsi:</td>
                <td colspan="2"><input type="text" name="food_description"></td>
            </tr>
            <tr>
                <td>Gambar:</td>
                <td colspan="2"><input type="file" name ="file"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="image" name="tambahMenu" value="add" src="../assets/savechanges.png" id ="logbutton" />
                </td>
                <td><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
            </tr>
        </table>
    </form>
</div>
