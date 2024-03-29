<%-- 
    Document   : history
    Created on : 13 Mei 13, 16:28:09
    Author     : Berty Tobing
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Pesanan"%>
<%@page import="ModelClass.PesananModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="his">
    <table>
        <tr>
            <td>
                <h3>Order History</h3>
                <br/>
                <br/>
            </td>
        </tr>
        <tr>
            <td width="850px">
                <%
                    Cookie[] cookies = request.getCookies();
                    String name = null;
                    if (cookies != null && cookies.length != 0) {
                        for (int i = 0; i < cookies.length; i++) {
                            Cookie cookie = cookies[i];
                            if (cookie.getName().equals("username")) {
                                name = cookies[i].getValue();
                            }
                        }
                    }
                    
                    String param = request.getParameter("sorting");
                    if (param == null) {
                        param = "1";
                    }

                    String order = "", cetak = "";

                    if (param.equals("2")) {
                        order = "total_biaya";
                        cetak = "Total Biaya";
                    } else if (param.equals("3")) {
                        order = "date";
                        cetak = "Tanggal";
                    } else if (param.equals("4")) {
                        order = "username";
                        cetak = "Username";
                    } else {
                        order = "id";
                        cetak = "ID";
                    }
                    out.print("<center");
                    out.print("<section class='container'>");
                    out.print("<h2>Diurutkan berdasarkan " + cetak + "</h2>");
                    out.print("<br/>");
                    out.print("<table border='1' style='background-color: orange'>");
                    out.print("<thead>");
                    out.print("<tr>");
                    out.print("<td><strong>No</strong></td>");
                    out.print("<td><strong>ID Order</strong></td>");
                    out.print("<td><strong>Total Harga</strong></td>");
                    out.print("<td><strong>Tanggal Pemesanan</strong></td>");
                    out.print("</tr>");
                    out.print("</thead>");

                    PesananModel pes = new PesananModel();
                    ArrayList<Pesanan> pesanan = pes.history(name, order);

                    int N = pesanan.size();
                    if (N > 0) {
                        out.print("<tbody>");
                        for (int i = 0; i < N; i++) {
                            out.print("<tr>");
                            out.print("<td>" + (i + 1) + "</td>");
                            out.print("<td>" + pesanan.get(i).getId() + "</td>");
                            out.print("<td>" + pesanan.get(i).getTotalBiaya() + "</td>");
                            out.print("<td>" + pesanan.get(i).getDate() + "</td>");
                            out.print("</tr>");
                        }
                        out.print("</tbody>");
                    }
                    out.print("</table>");
                    out.print("</section>");
                    out.print("</center>");
                %>
            </td>

           
        <tr>
            <td>
                <br/>
                <br/>
                <form action="orderhistory.jsp?sort=" + <%= request.getParameter("sorting")%> >
                    <select name ="sorting">
                        <option value="1">ID Order</option>
                        <option value="2">Total Harga</option>
                        <option value="3">Tanggal Pemesanan</option>
                    </select>
                    <br/>
                    <br/>
                    <input type="image" name="cari" value="Cari" src="assets/savechanges.png" id ="logbutton" />
                </form>
            </td>
        </tr>
    </table>
</div>