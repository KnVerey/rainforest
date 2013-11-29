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
      listenForDelete();
    });

  listenForDelete();
});

function listenForDelete() {
  return $(".ajax-delete")
    .on('ajax:complete', function(){ $(this).closest('.message-case').remove(); });
}