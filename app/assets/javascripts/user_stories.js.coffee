# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".state").change(->
    elem = $(this);
    elem.parents("form:first").submit()
    $(elem[0].parentNode).toggleClass("lineThrough")
    return
  )
   
  $(".deleteTask").click (event) ->
    $(event.currentTarget).parents("li:first").remove()
    return

 return
