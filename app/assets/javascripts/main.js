$(document).ready(function() {

	$('.cart-icon').hide();

	validateUserInfo($('#user_id'));

	$('.qtd-icon').on('click', function() {

		qtdsContainer = $(this).parent().find('.qtd-icon')

		if ($(this).hasClass("selected")) {
			clearQauntities(qtdsContainer);
			$(this).parent().parent().find('.cart-icon').hide();
		} else {
			clearQauntities(qtdsContainer);
			$(this).css({
				"background-color" : "#684f40",
				"color" : "#FFF",
				"border-color" : "#684f40"
			});
			$(this).find('a').css("color", "#FFF");
			$(this).addClass("selected");
			$(this).parent().parent().find('.cart-icon').show();
		}
		calcPrice($(this));
	});

	$('#user_email').on('blur', function() {
		findUser($(this));
	});

	$('#btnPlaceOrder').on('click', function() {
		placeOrder($('#idUSer'))
	});	
});

function sendEmailService() {
	var nameSender = $('#name-service').val();
	var addressSender = $('#email-service').val();
	var service = $('#select-services').find('option:selected').text();
	var message = $('#message-service').val();
	
	$.ajax({
		type : "POST",
		url : urlContext + '/services/sendEmail',
		async : true,
		data : {
			'message' : message,
			'service' : service,
			'nameSender' : nameSender,
			'addressSender' : encodeURI(addressSender)
		},
		success : function(data) {
			console.log(data);
		}
	});
}

function findUser(userEmailInput) {

	if (userEmailInput.val().trim() != "") {

		$.ajax({
			type : "POST",
			url : urlContext + '/user/findUser.json',
			async : true,
			data : {
				'email' : userEmailInput.val()
			},
			success : function(user) {
				$('#user_info_comp').show();
				$('.place-order').show();
				if (user) {
					$('#user_phone').val(user.phone);
					$('#user_first_name').val(user.firstName);
					$('#user_last_name').val(user.lastName);
				}
			}
		});
	}
}

function calcPrice(containerDiv) {

	var containerId = '';
	var productId = containerDiv.attr('prod-id');

	if (containerDiv.hasClass("selected")) {
		containerId = containerDiv.attr('container-id');
	}

	$.post('products/calculatePrice.json', {
		'productId' : productId,
		'containerId' : containerId
	}, function(data) {
		productDiv = containerDiv.parent().parent();
		productDiv.find('.price-value').text(data.toFixed(2));
		productDiv.find('.cart-icon')
				.attr('selected-container-id', containerId);
	});
}

function clearQauntities(qtdsContainer) {
	qtdsContainer.each(function() {
		$(this).css({
			"background-color" : "",
			"color" : "",
			"border-color" : ""
		});
		$(this).find('a').css("color", "#fdb822");
		$(this).removeClass("selected")
	})
}

function addCart(productId, linkElement) {
//	containerId = $(linkElement).parent().attr('selected-container-id');
//
//	var productsId = [];
//	productsId.push(productId);
//
//	post('products/addcart', {
//		productsId : productsId,
//		containerId : containerId
//	});
}

function post(url, params) {
	var form = $('<form method="post" action="' + url + '"></form>');
	for ( var param in params) {
		form.append('<input type="hidden" name="' + param + '" value="'
				+ params[param] + '"/>');
	}
	form.appendTo("body").submit();
}

function validateUserInfo(userIdInput) {
	if (!$(userIdInput).val()) {
		$('#user_info_comp').hide();
		$('.place-order').hide();
	}
}