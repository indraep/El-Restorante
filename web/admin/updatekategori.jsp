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
    int kategori = Integer.parseInt(request.getParameter("update"));
    String name = request.getParameter("kategori");
    
    CategoryModel cm = new CategoryModel();
    
    if (name != null && name.length() > 0) {
        cm.updateKategori(kategori, name);
        response.sendRedirect("index.jsp");
    }
    else {
        response.sendRedirect("viewupdatekategori.jsp?update=" + kategori);
    }
    
    
%>

<div id ="daftar">
    <h3>Ubah kategori</h3>
    <br/>
    <br/>
    <form action="updatekategori.jsp?" method="post">
        <table>
            <tr>
                <td width="250px">Nama:</td>
                <td colspan="2"><input type="text" name="kategori" value="<%= cm.getCategoryName(kategori) %>"></td>
            </tr>
           
            <tr>
                <td></td>
                <td><input type="image" name="tambahKategori" value="add" src="../assets/savechanges.png" id ="logbutton" />
                    <input type="hidden" name="update" value="<%= kategori %>"/>
                </td>
                <td><a href="index.jsp"><img src="../assets/cancel.png" id ="logbutton"/></td>
                            </tr>

                            </table>
                            </form>
                            </div>
