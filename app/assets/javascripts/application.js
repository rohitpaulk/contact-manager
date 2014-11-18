// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function () {
	$('.delete-contact').click(function (e) {
		var contact_id = $(e.target).data("id");
		var data = {id: contact_id}
		if (confirm("Are you sure?")) {
			$.ajax({
				type: "POST",
				url: "/delete",
				data: data,
				success: function () {
					$(e.target).parent().parent().parent().remove();
				},
				error: function () {
					alert("Sorry, couldn't delete contact!");
				}
			});
		}
	});
});