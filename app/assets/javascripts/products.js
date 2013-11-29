$(document).ready (function() {
   $("#new_review")
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
});
