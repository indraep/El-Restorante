$(document).ready(function() {
    printCart(); 
});

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
	
	if (c == "null" || c == "") {
		document.getElementById("cart").innerHTML = "";
		return;
	}
	
	var isi = "";
	var temp = c.split("-");
	
	var i = 0;
	for (i = 0; i < temp.length; i++) {
		if (isi.length > 0)
			isi += "<br />";
		
		isi += "<p class='category'>" + getName(temp[i]) + "</p> <a style=\"margin-left: 7px;\" href=javascript:removeFromCart(" + getId(temp[i]) + ")>remove</a>";
	}
        
        if (isi.length > 0) {
            isi += "<br /><img src='#' alt='Check out'/>";
        }
        
	document.getElementById("cart").innerHTML = isi;
}

function clearCart() {
	$.cookie("cart", null);
}

function removeFromCart(id) {
	var c = $.cookie("cart");
	if (c == "null" || c == "" || c == "undefined") {
		c = "";
		$.cookie("cart", "")
	}
	
	var temp = c.split("-");
	
	var i = 0;
	var isi = "";
	for (i = 0; i < temp.length; i++) {
		if (getId(temp[i]) == id) {
			continue;
		}
		
		if (isi.length > 0) isi += "-";
		isi += temp[i];
	}
	
	$.cookie("cart", isi);
	printCart();
}

function addToCart(content) {
	var id = getId(content);
	var name = getName(content);
	
	var c = $.cookie("cart");
	if (c == undefined || c == "null" || c == "") {
                c = "";
		$.cookie("cart", "")
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
		c += "(" + id + "," + name + ")";
		$.cookie("cart", c);
	}
	printCart();
}