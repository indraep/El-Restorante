<%-- 
    Document   : history
    Created on : 13 Mei 13, 16:28:09
    Author     : Berty Tobing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="his">
    <table>
        <tr>
            <td>
                <h3>Order History</h3>
            </td>
            <td><h3>Urutkan berdasar:</h3></td>
        </tr>
        <tr>
            <td width ="600px">
                <%
                    out.print("<table border='1'>");
                    out.print("<tr>");
                    out.print("<td>No</td>");
                    out.print("<td>ID Order</td>");
                    out.print("<td>Barang</td>");
                    out.print("<td>Total Harga</td>");
                    out.print("<td>Tanggal Pemesanan</td>");
                    out.print("</tr>");

                    for (int i = 0; i < 5; i++) {
                        out.print("<tr>");
                        for (int j = 0; j < 5; j++) {
                            out.print("<td>i</td>");
                        }
                        out.print("</tr>");
                    }
                    out.print("</table>");
                %>
            </td>

            <td>
                <select>
                    <option value="orderID">ID Order</option>
                    <option value="item_amount">Jumlah Barang</option>
                    <option value="total_price">Total Harga</option>
                    <option value="order_date">Tanggal Pemesanan</option>
                </select>
            </td>
        </tr>
    </table>
</div>