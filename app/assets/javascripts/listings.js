$(document).ready (function() {
 $("#new_message")
    .on('ajax:beforeSend', function() {
      $("input[type='submit']")
        .val('Saving...')
        .attr('disabled', 'disabled');
    })
    .on('ajax:complete', function() {
      $("input[type='submit']")
        .val('Post message to owner')
        .removeAttr('disabled');
    });

  $("#list-messages")
    .on('ajax:complete', "a", function(){
      alert("Success");
      $(this).closest('.message-case').remove();
    });

  $(".ajax-delete")
    .on('click', function(event){
      event.preventDefault();
      var ok = confirm("Are you sure you want to delete this message?");

      if (ok) {
        var url = $(this).attr("href");

        $.ajax({
          type: "DELETE",
          url: url,
          dataType: "json",
          data: {}
        });
      }
    });
});