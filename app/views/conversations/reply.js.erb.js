

/* Add the new comment to the bottom of the comments list */
$("#conv_message").prepend("<%= escape_javascript(render(@receipt)) %>");


/* Reset the comment form */
$("#conv_message_form")[0].reset();
