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
    .on('click', ".ajax-delete", function(event){
      var self = $(this),
          message = self.closest(".message-case"),
          ok = confirm("Are you sure you want to delete this message?");

      event.preventDefault();

      if (ok) {
        var url = $(this).attr("href");

        $.ajax({
          type: "DELETE",
          url: url,
          dataType: "json"
        }).done(function(data){
          self.closest('.message-case').remove();
        });
      }
    });
});