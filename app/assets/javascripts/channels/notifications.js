App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  // connected: ->
  //   # Called when the subscription is ready for use on the server

  // disconnected: ->
  //   # Called when the subscription has been terminated by the server

  received: function(data) {
    // # Called when there's incoming data on the websocket for this channel
    var len = $('.notification-button').html().length;
    var count = parseInt($('.notification-button').html().substring(15,len-1));
    count = count + 1;
    $('.notification-button').html("Notifications (" + count + ")");
    $('ul.append-notification-dropdown > li:first-child').before("<li><a href='/notifications/" + data.id + "'>" + data.message + "</a></li>")
    if (count === 1) {
      $('.default-notification').hide();
    };
    $('#flash').html(data.message).addClass("alert alert-info");
    setTimeout(function(){$('#flash').fadeOut('slow')},3000)
  }
});