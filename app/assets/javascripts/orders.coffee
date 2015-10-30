# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('#add_btn').click() if $('#error_explanation') == undefined
  $('#delete_btn').remove()
  $('#custom_pizza_fields').hide()
  $(':radio').change ->
    if $('#custom_pizza').is(":checked")
      $('#custom_pizza_fields').show()
    else
      $('#custom_pizza_fields').hide()
