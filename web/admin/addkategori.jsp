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
    String kategori = request.getParameter("kategori");
    
    if (kategori != null && kategori.length() > 0) {
        CategoryModel kate = new CategoryModel();
        boolean hasil = kate.addKategori(kategori);
        response.sendRedirect("viewaddkategori.jsp");
    }
    else {
        response.sendRedirect("viewaddkategori.jsp");
    }
    
%>

<div id ="daftar">
    <h3>Tambahkan kategori</h3>

    <form action="addkategori.jsp" method="post">
        <table>
            <tr>
                <td width="250px">Nama:</td>
                <td colspan="2"><input type="text" name="kategori"></td>
            </tr>
           
            <tr>
                <td></td>
                <td><input type="image" name="tambahKategori" value="add" src="../assets/savechanges.png" id ="logbutton" />
                    <input type="hidden" name="hi" value="hii"/>
                </td>
                <td><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
                            </tr>

                            </table>
                            </form>
                            </div>
