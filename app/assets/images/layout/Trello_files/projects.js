(function() {
  var ready;

  ready = function() {
    $('.user_story_state').change(function() {
      alert("in the name of allah");
      $(this).parents("form:first").submit();
    });
  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

}).call(this);
