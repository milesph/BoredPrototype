// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/* TEMPORARILY REMOVE ISOTOPE
var $container = $('#events');

// Set up isotope on .event
$container.isotope({
  itemSelector: '.event'
});

// Expand event when clicked
$container.delegate('.event', 'click', function() {

  $(this).toggleClass('expanded');
  
  // This causes severe performance issues.
  $container.isotope('reLayout');
});
*/
/*

var App = {
  Views: {},
  Routers: {},
  init: function() {
    new App.Routers.Events();
    Backbone.history.start();
  }
};
*/

function updateInfo(node) {
  var infoBar = $('.info-main');
  $('#info-title', infoBar).html($('.event-title', node).html());
  $('#info-desc', infoBar).html($('.event-desc', node).html());
  $('#info-location', infoBar).html($('.event-location', node).html());
  $('#info-date', infoBar).html($('.event-date', node).html());
}


$(function() {
  $('.datepicker').datepicker();
  $('.event').click(function(){
    updateInfo(this);
  });

	/* HAROLD'S CODE DO NOT INSULT */
	$('ul.category-list').click(function(e){
		if ( $(this).hasClass('expanded') ){
			var liPosition = $(e.target).position();
			$('li', this).css('top', -liPosition.top);
			$('.events-col-info').toggle();
			$(this).toggleClass('expanded');
		} else {
			$('li', this).css('top', 0);
			$(this).toggleClass('expanded');
			$('.events-col-info').toggle();
		}
	});
});

$('.field input').focus(function(){
  $(this).parent().addClass('form-focus');
});
$('.field input').blur(function(){
  $(this).parent().removeClass('form-focus');
});

function hide_cat(n){
	cat_string = ".cat-"+n;
	$(cat_string).css('display','none');
}

function show_cat(n){
	cat_string = ".cat-"+n;
	$(cat_string).css('display','inline');
}

//hide all events that have a category
function hide_all() {	
	for(var cur_cat in hashCategories)
	{
		hide_cat(hashCategories[cur_cat][1]);
	}
}

var show_categores = new Array(); //DELETE ME
show_categories = [1,2,3,4]; //DELETE ME

//Takes an array of categories, cats. Displays only events with those categories,
//  and hides all others.
function show_only_cats(cats){
	hide_all();
	
	for(var x in cats){
		show_cat(x);
	}
}

function hide_cat(n){
	cat_string = ".cat-"+n;
	$(cat_string).css('display','none');
}

function show_cat(n){
	cat_string = ".cat-"+n;
	$(cat_string).css('display','inline');
}