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
            <td><h3>Urutkan berdasar:</h3></td>
        </tr>
        <tr>
            <td width ="600px">
                <%
                    String param = request.getParameter("sorting");
                    if (param == null) param = "1";
                            
                    String order = "", cetak = "";
                    
                    if (param.equals("2")) {
                        order = "total_biaya";
                        cetak = "Total Biaya";
                    }
                    else if (param.equals("3")) {
                        order = "date";
                        cetak = "Tanggal";
                    }
                    else if (param.equals("4")) {
                        order = "username";
                        cetak = "Username";
                    }
                    else {
                        order = "id";
                        cetak = "ID";
                    }

                    out.print("<h3>Diurutkan berdasarkan " + cetak + "</h3>");
                    out.print("<br/>");
                    out.print("<table border='1'>");
                    out.print("<tr>");
                    out.print("<td>No</td>");
                    out.print("<td>ID Order</td>");
                    out.print("<td>Total Harga</td>");
                    out.print("<td>Tanggal Pemesanan</td>");
                    out.print("<td>Username</td>");
                    out.print("</tr>");

                    PesananModel pes = new PesananModel();
                    ArrayList<Pesanan> pesanan = pes.cari(order);

                    int N = pesanan.size();
                    if (N > 0) {
                        for (int i = 0; i < N; i++) {
                            out.print("<tr>");
                            out.print("<td>" + (i + 1) + "</td>");
                            out.print("<td>" + pesanan.get(i).getId() + "</td>");
                            out.print("<td>" + pesanan.get(i).getTotalBiaya() + "</td>");
                            out.print("<td>" + pesanan.get(i).getDate() + "</td>");
                            out.print("<td>" + pesanan.get(i).getUsername() + "</td>");
                            out.print("</tr>");
                        }
                    }
                    out.print("</table>");
                %>
            </td>

            <td>
                <form action="orderhistory.jsp?sort=" + <%= request.getParameter("sorting")%> >
                      <select name ="sorting">
                        <option value="1">ID Order</option>
                        <option value="2">Total Harga</option>
                        <option value="3">Tanggal Pemesanan</option>
                        <option value="4">Username</option>
                    </select>
                    <br/>
                    <br/>
                    <input type="image" name="cari" value="Cari" src="../assets/savechanges.png" id ="logbutton" />
                </form>
            </td>
        </tr>
    </table>
</div>