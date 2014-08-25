# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $("#user_story_state").change(->
    alert "in the name of allah"
    $(this).parents("form:first").submit()
    return
  )
  return

$(document).ready(ready)
$(document).on('page:load', ready)