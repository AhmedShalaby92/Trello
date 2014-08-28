# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.user_story_state').change(->
    $(this).parents("form:first").submit()
    return
  )

  $(".formElement").change(->
  	console.log $(this)
  	$(this).submit();
  	return 
  )
  return

$(document).ready(ready)
$(document).on('page:load', ready)