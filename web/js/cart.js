$(document).ready(function() {
    printCart(); 
    alert(getOrder());
    printCart();
});

function getOrder() {
    var c = $.cookie("cart");
    if (c == undefined || c == "null" || c == "") {
        c = "";
    }
    return c;
}

function getPrice(content) {
    content = content.substring(1, content.length - 1);
    var t = content.split(",");
    return t[2];
}

function getName(content) {
    content = content.substring(1, content.length - 1);
    var t = content.split(",");
    return t[1];
}

function getId(content) {
    content = content.substring(1, content.length - 1);
    var t = content.split(",");
    return t[0];
}

function printCart() {
    var c = $.cookie("cart");
    if (c == undefined || c == "null" || c == "") {
        document.getElementById("cart").innerHTML = "";
        return;
    }

    var isi = "";
    var temp = c.split("-");

    var i = 0;
    for (i = 0; i < temp.length; i++) {
        if (isi.length > 0)
            isi += "<br />";
            
        var len = 13;
        var nama = getName(temp[i]);
        if (nama.length > len) nama = nama.substring(0, len) + "...";
        
        isi += "<p class='category'>" + nama + "</p> <a style=\"margin-left: 5px;\" href=javascript:removeFromCart(" + getId(temp[i]) + ")>a</a>";
    }

    if (isi.length > 0) {
        isi += "<br /><center><a href='checkout.jsp'><img src='assets/checkout.png' alt='Check out'  id='order' /></a></center>";
    }

    document.getElementById("cart").innerHTML = isi;
}

function clearCart() {
    $.cookie("cart", null, {path: "/"});
}

function removeFromCart(id) {
    var c = $.cookie("cart");
    if (c == undefined || c == "null" || c == "") {
        c = "";
        $.cookie("cart", "", {path: "/"});
    }

    var temp = c.split("-");

    var i = 0;
    var isi = "";
    for (i = 0; i < temp.length; i++) {
        if (getId(temp[i]) == id) {
            continue;
        }

        if (isi.length > 0)
            isi += "-";
        isi += temp[i];
    }

    $.cookie("cart", isi, {path: "/"});
    printCart();
}

function addToCart(content) {
    var id = getId(content);
    var name = getName(content);
    var price = getPrice(content);

    var c = $.cookie("cart");
    if (c == undefined || c == "null" || c == "") {
        c = "";
        $.cookie("cart", "", {path: "/"})
    }

    var temp = c.split("-");
    var i = 0;
    var valid = true;
    for (i = 0; i < temp.length; i++) {
        if (getId(temp[i]) == id)
            valid = false;
    }
    if (valid) {
        if (c.length > 0)
            c += "-";
        c += "(" + id + "," + name + "," + price + ")";
        $.cookie('cart', c, {path: "/"});
    }
    printCart();
}