<%-- 
    Document   : orderhistory
    Created on : 13-May-2013, 14:59:07
    Author     : cLienT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
    </head>
    <body>
        <div id="historylist">
            <%
                out.print("<table>");
                out.print("<th>");
                out.print("<td>No</td>");
                out.print("<td>ID Order</td>");
                out.print("<td>Barang</td>");
                out.print("<td>Total Harga</td>");
                out.print("<td>Tanggal Pemesanan</td>");
                out.print("</th>");

                for (int i = 0; i < 5; i++) {
                    out.print("<tr>");
                    for (int j = 0; j < 5; j++) {

                    }
                    out.print("</tr>");
                }
                out.print("</table>");
            %>
        </div>
        <div id="ordersorting">
            <p>Urutkan berdasar:</p>
            <select>
                <option value="orderID">ID Order</option>
                <option value="item_amount">Jumlah Barang</option>
                <option value="total_price">Total Harga</option>
                <option value="order_date">Tanggal Pemesanan</option>
            </select>
        </div>

    </body>
</html>