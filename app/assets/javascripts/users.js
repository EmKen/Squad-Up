$(document).on('turbolinks:load',function(){
	$('.edit_user').hide();
	$('#edit-icon').click(function(event){
		event.preventDefault();
		$('.error-message').remove();
		if ($('.edit_user').css('display')=='none') $('.edit_user').slideDown(200);
		else $('.edit_user').slideUp(200);
	});
	
	// Tried to do the long way but failed. Couldn't submit multiple times as form would get disabled after 1 submit. 
	// CSRF token maybe?

	// $('.edit_user').submit(function(event){
	// 	$('error-message').hide();
	// 	event.preventDefault();
	// 	var id = $('.edit_user').attr('id').substring(10);
	// 	$.ajax({
	// 		url: '/users/' + id,
	// 		type: 'POST',
	// 		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
	// 		data: $(this).serialize(),
	// 		dataType: 'json',
	// 		success: function(data) {
	// 			debugger
	// 			$("img[alt='Profile picture']").prop('src')
	// 		},
	// 		error: function(data) {
	// 			debugger
	// 			$('h1.middle1').before("<br><p class='error-message'>" + data.responseJSON['error_message'] + "</p>")
	// 		}, 
	// 		complete: function(data) {
	// 			$('.edit_user').prop("disabled", false);
	// 			$('.edit_user').removeAttr("disabled");
	// 			$('.edit_user').hide();
	// 		}
	// 	});
	// })
});
