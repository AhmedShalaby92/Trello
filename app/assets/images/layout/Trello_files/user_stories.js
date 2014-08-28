$(document).ready(function() {  
  $(".state").change(function() {
    $(this).parents("form:first").submit();
  }, 

  $(".deleteTask").click(function(event) {
    event.preventDefault();
    $.ajax({
      type: "DELETE",
      url:  this.attr("href"),
      dataType: "json",
      data: {
        _method: "delete"
      },
      complete: function() {
        alert("Deleted successfully");
      }
    });
  }));
});





