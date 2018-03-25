var brigadeiros = null;
var brigadeirosSelecionados = [];
var prices = [0,0,0,0,0,0];

$(document).ready(function() {
	
	$('.flavour-row').hide();
	
	$('.qtd-bigadeiros').on('click', function() {
		$('.qtd-flavours').removeClass('customize-button-active');
		$('#customize_content').hide();
		$('.qtd-bigadeiros').removeClass('customize-button-active');
		$(this).addClass('customize-button-active');
		$('#customize_flavours').hide();
        $('#customize_flavours').slideDown("slow");
        $('#boxQuantity').val($(this).val());
        $('#flavourQuantity').val("");
        
        $('.qtd-flavours').hide();
        $('#btn-one-flavour').show();
        $('#btn-two-flavour').show();

        if ($(this).val() == 12) {
        	$('#btn-three-flavour').show();
        	$('#btn-four-flavour').show();
        }
        
        if ($(this).val() == 18) {
        	$('#btn-three-flavour').show();
        	$('#btn-six-flavour').show();
        }
	});
	
	$('.qtd-flavours').on('click', function() {
		$('.qtd-flavours').removeClass('customize-button-active');
		$(this).addClass('customize-button-active');
		$('#customize_content').hide();
        $('#customize_content').slideDown("slow");
        $('#flavourQuantity').val($(this).val());        
        $('.flavour-row').hide();
        
        for (i = 1; i <= $(this).val(); i++) {
        	$('#flavour' + i + 'row').show();
        }
        
        $('#eachQuantity').val($('#boxQuantity').val() / $('#flavourQuantity').val());
        $('.customize-quantity p').text($('#eachQuantity').val());
        resetFlavours();
	});
	
	$('.filling-select').on('change', function() {
		image = $('#imagesUrl').val() +"/"+ $(this).find('option:selected').attr('image_url');
		$(this).parent().find('img').attr('src', image);		
		updateRow($(this).parent().parent()[0]);
		
	});
	
	$('.sprinkle-select').on('change', function() {
		image = $('#imagesUrl').val() +"/"+ $(this).find('option:selected').attr('image_url');
		$(this).parent().find('img').attr('src', image);
		updateRow($(this).parent().parent()[0]);
	});

	$('.customize-add-button').on('click', function() {
//		addCustomToCart();
	});
	
	$.getJSON(urlContext + '/products/chocoball.json', function(json) {
        $('.filling-select').empty();
        $('.filling-select').append($('<option>').text("Select a filling...").attr('value', "0").attr('image_url', 'product1.png'));
        $.each(json, function(i, obj){
                $('.filling-select').append($('<option>').text(obj.value).attr('value', obj.key).attr('image_url', obj.imageUrl));
        });
	});
	
	$.getJSON(urlContext + '/products/sprinkle.json', function(json) {
        $('.sprinkle-select').empty();
        $('.sprinkle-select').append($('<option>').text("Select a sprinkle...").attr('value', "0").attr('image_url', 'product1.png'));
        $.each(json, function(i, obj){
                $('.sprinkle-select').append($('<option>').text(obj.value).attr('value', obj.key).attr('image_url', obj.imageUrl));
        });
	});
	
	$.getJSON(urlContext + '/products/brigadeiro.json', function(json) {
		brigadeiros = json;
	});
});

function updateRow(row) {
	chocoballSelected = $(row).find('.customize-filling select option:selected').val();
	sprinkleSelected = $(row).find('.customize-sprinkles select option:selected').val();
	
	if ((chocoballSelected && sprinkleSelected) && (chocoballSelected > 0 && sprinkleSelected > 0)) {
		bigadeiro = getBrigadeiro(chocoballSelected, sprinkleSelected);
		brigadeirosSelecionados[row.rowIndex - 1] = bigadeiro;
		$(row).find('.your-brigadeiro img').attr('src', $('#imagesUrl').val() +"/"+ bigadeiro.urlIcon);
		price = $('#eachQuantity').val() * bigadeiro.price;
		$(row).find('.amount')[0].innerHTML= "&#36;" + price.toFixed(2);
		prices[row.rowIndex -1] = price;
	} else {
		$(row).find('.your-brigadeiro img').attr('src', $('#imagesUrl').val() +"/product1.png");
		$(row).find('.amount')[0].innerHTML = "";
		prices[row.rowIndex -1] = 0;
	}
	updateTotalPrice();
}

function updateTotalPrice() {
	
	totalPrice = 0;
	totalFlavours = $('#flavourQuantity').val();
	
	for (i = 0; i < prices.length; i++) {
		if (prices[i] && prices[i] > 0 && i < totalFlavours ) {
			totalPrice += prices[i];
        }
	}

	$('.box-custom-total-price .amount')[0].innerHTML = "&#36;" + totalPrice.toFixed(2);
}

function getBrigadeiro(chocoballSelected, sprinkleSelected) {
	for (i = 0; i < brigadeiros.length; i++) {
		if (brigadeiros[i].chocoballId == chocoballSelected && brigadeiros[i].sprinkleId == sprinkleSelected) {
        	return brigadeiros[i];
        }
	}
}

function resetFlavours() {
	$('.filling-select').val(0).change();
	$('.sprinkle-select').val(0).change();
}



function addCustomToCart() {

	var product = {};
	product.boxQuantity = $('#boxQuantity').val();
	product.flavourQuantity = $('#flavourQuantity').val();
	product.brigadeiros = brigadeirosSelecionados;

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : urlContext + '/products/addcart',
		data : JSON.stringify(product),
		dataType : 'json',
		async : false,
		success : function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
			if (a) {
				$('.flavour-row').hide();
				$('.qtd-flavours').hide();
				$('.qtd-bigadeiros').removeClass('customize-button-active');
				$('#customize_content').hide();
				$('#customize_flavours').hide();
			}
		},
		error : function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		}
	});
}