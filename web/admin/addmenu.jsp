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
<%@ page import="org.apache.commons.fileupload.*"%>   
<%@ page import="org.apache.commons.io.output.*"%>   
<%@ page import="org.apache.commons.fileupload.servlet.*"%>   
<%@ page import="org.apache.commons.fileupload.disk.*"%>   
<%@ page import="java.io.*"%>   
<%@ page import="java.util.*"%>   
<%
    String kategori = request.getParameter("kategori");
    String nama = request.getParameter("food_name");
    String harga = request.getParameter("food_price");
    String deskripsi = request.getParameter("food_description");
    String picture = request.getParameter("picture");
    
    //if (kategori != null && kategori.length() > 0 && nama != null && nama.length() > 0 && harga != null && harga.length() > 0 && deskripsi != null && deskripsi.length() > 0) {
        //MenuModel menu = new MenuModel();
        //menu.addMenu(kategori, nama, harga, deskripsi);
        //response.sendRedirect("viewaddmenu.jsp");
    //} else {
        //response.sendRedirect("viewaddmenu.jsp");
    //}
%>

<div id ="daftar">
    <h3>Tambahkan menu</h3>
<<<<<<< HEAD

    <form action="utilities/upload_menu_image.jsp" method="post" enctype="multipart/form-data">
=======
    <br/>
    <br/>
    <form action="addmenu.jsp" method="post">
>>>>>>> e1148aee80af5fc9c5e6297a8cad1f55dbd82bcb
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
                <td colspan="2"><input type="file" name ="picture"></td>
            </tr>
            <tr>
                <td></td>
<<<<<<< HEAD
                <td>
                    <input type="image" name="tambahMenu" value="add" src="../assets/savechanges.png" id ="logbutton" />
                </td>
                <td><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
            </tr>
=======
                <td style="padding-top: 20px"><input type="image" name="tambahMenu" value="add" src="../assets/savechanges.png" id ="logbutton" />
                    <input type="hidden" name="hi" value="hii"/>
                </td>
                <td style="padding-top: 20px"><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
                            </tr>
>>>>>>> e1148aee80af5fc9c5e6297a8cad1f55dbd82bcb

        </table>
    </form>
</div>
