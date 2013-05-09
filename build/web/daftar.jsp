<%-- 
    Document   : daftar
    Created on : 09 Mei 13, 11:53:46
    Author     : Berty Tobing
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModelClass.CategoryModel"%>

<div id = "daftar">   
    <h3>Daftar Menu</h3>
    <%
        out.print("<table>");
        for (int i = 0; i < 3; ++i) {
            out.print("<tr style='padding: 300'>");
            for (int j = 0; j < 6; ++j) {
                if (j % 2 == 0) {
                    out.print("<td>");
                    out.print("<img src='assets/AyamGoreng.jpg' height='150' width='150'>");
                    out.print("</td>");
                } else {
                    out.print("<td>");
                    out.println("Nama: Ayam bakar");
                    out.print("<br>");
                    out.println("Harga: 10000");
                    out.print("<br>");
                    out.println("TOMBOL PESAN");
                    out.print("</td>");
                }
            }
            out.print("</tr>");
        }
        out.print("</table>");
    %>
</div>
