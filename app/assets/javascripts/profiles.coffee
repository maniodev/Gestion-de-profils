# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('#alert').fadeTo(2000, 500).slideUp 500, ->


$(document).on 'click', '#selectAll', (e) ->
  if @checked
    $('.export').prop 'disabled', false
    $('input[id^="profiles_"]').each ->
      @checked = true
      $(this).parents().eq(2).addClass 'selected'
      return
  else
    $('.export').prop 'disabled', true
    $('input[id^="profiles_"]').each ->
      @checked = false
      $(this).parents().eq(2).removeClass 'selected'
      return
  return



$(document).on 'change', 'input[id^="profiles_"]', (e) ->
  if @checked
    $(this).parents().eq(2).addClass 'selected'
  else
    $('.export').prop 'disabled', true
  $(this).parents().eq(2).removeClass 'selected'
  $('input[id^="profiles_"]').each ->
    if @checked == true
      $('.export').prop 'disabled', false
      return false
    return
  return
