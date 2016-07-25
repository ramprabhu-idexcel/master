App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if typeof data.create_comment != 'undefined'
      $('#comments').append data.create_comment
    if typeof data.delete_comment != 'undefined'
      $('p#comment_' + data.delete_comment).remove()
    if typeof data.update_comment != 'undefined'
      $('p#comment_'+data.comment_id).html(data.update_comment)
