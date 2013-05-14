<%-- 
    Document   : checkout_content
    Created on : May 14, 2013, 12:21:19 PM
    Author     : indraep
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $(".jumlah").change(function() {
            var id = $(this).attr("id");
            var ctr = $(this).attr("name");
            var val = document.getElementById(id).value;
            
            if (val < 0) {
                val = 0;
                alert("Jumlah tiap item tidak boleh kurang dari nol.");
            }
            
            document.getElementById(id).value = val;
            var prevTotal = parseInt(document.getElementById("totalHarga" + ctr).innerHTML);
            document.getElementById("totalHarga" + ctr).innerHTML = document.getElementById("harga" + ctr).innerHTML * val;
            var curTotal = parseInt(document.getElementById("totalHarga" + ctr).innerHTML);
            var totalBiaya = parseInt(document.getElementById("totalBiaya").innerHTML);
            totalBiaya += (curTotal - prevTotal);
            document.getElementById("totalBiaya").innerHTML = totalBiaya;
        });
    });
    
    function isValid(n) {
        for (var i = 0; i < n.length; i++) {
            if (n.charAt(i) < '0' || n.charAt(i) > '9')
                return false;
        }
        return true;
    }
    
    function isiDetailPesanan() {
        var detailPesanan = document.getElementById("detail_pesanan");
        var temp = getOrder();
        var order = temp.split("-");
        
        var isi = "<tr><td width='10px'>No.</td><td width='200px'>Nama</td><td width='120px'>Harga Satuan</td>" +
                "<td width='10px'>Jumlah</td><td width='150px'>Jumlah Harga</td></tr>";
        var total = 0;
        for (var i = 0; i < order.length; i++) {
            total += parseInt(getPrice(order[i]));
            isi += "<tr>";
                isi += "<td>";
                    isi += (i + 1);
                isi += "</td>";
                isi += "<td>";
                    isi += getName(order[i]);
                isi += "</td>";
                isi += "<td>";
                    isi += "Rp. <strong id='harga" + i +"'>" + getPrice(order[i]) + "</strong>";
                isi += "</td>";
                isi += "<td>";
                    isi += "<input class='jumlah' id='total"+ i +"' name = '" + i + "' type='number' value='1' />"
                isi += "</td>";
                isi += "<td>";
                    isi += "Rp. <strong id='totalHarga" + i +"'>" + getPrice(order[i]) + "</strong>";
                isi += "</td>";
            isi += "</tr>";
        }
        isi += "<tr>";
            isi += "<td colspan='4'><strong>Total Harga Pesanan</strong></td>";
            isi += "<td>Rp. <strong id='totalBiaya'>" + total + "</strong></td>";
        isi += "</tr>";
        detailPesanan.innerHTML = isi;
    }
    
    function order() {
        alert("ADA");
        
        var username = $.cookie("username");
        var totalBiaya = document.getElementById("totalBiaya").innerHTML;
        var pesanan = "";
        var temp = getOrder();
        var c = temp.split("-");
        
        for (var i = 0; i < c.length; i++) {
            if (pesanan.length > 0) pesanan += "-";
            var temp = c[i].substring(0, c[i].length - 1);
            var jumlah = document.getElementById("total" + i).value;
            if (jumlah.length == 0) jumlah = 0;
            if (jumlah > 0)
                pesanan += temp + "," + jumlah + ")";
        }
        
        $.ajax({
            type:       "post",
            url:        "ajaxQuery/buatPesanan.jsp",
            data:       {
                "username": username,
                "pesanan": pesanan,
                "total_biaya": totalBiaya
            },
            success:    function(msg) {
                msg = msg.trim();
                var confirmationCode = window.prompt("Nomor pesanan anda adalah:\n\n" + msg + "\n\nSilahkan lakukan pembayaran dengan PayBro dan masukkan kode verifikasi!");
                
                // cancel or salah
                if (confirmationCode == null || false) {
                    
                }
                // correct confirmation code
                else {
                    
                }
            }
        });
        return false;
    }
    
    function tes() {
    alert("ada");
    }
</script>

<div id="checkout">
    <h3>Checkout</h3>
    <br/>
    <br/>
    <table id="detail_pesanan" border="1">
        <% out.print("<script>isiDetailPesanan();</script>"); %>
    </table>
    <br/>
    <br/>
    <a href="javascript:order()" ><img alt="Order" src="assets/order.png" /></a>
    <a href="index.jsp" ><img alt="Cancel" src="assets/cancel.png" /></a>
</div>
