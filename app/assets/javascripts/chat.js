$(document).ready(function () {
  var $submitButton = $('.submit');
  var $message = $('.message');
  var $messages = $('.messages');

  $submitButton.on('click', function () {
    var channel = $message.data('channel');
    var messageBody = $message.val();
    $.ajax({
      method: 'POST',
      url: '/messages',
      dataType: 'json',
      data: { message: { body: messageBody, channel: channel } },
      success: clearChatInputField($message)
    });
  });
});

function appendMessageToRoom (element, data) {
  element.append('<p>' + data.message.body + ' [' + data.user + '] [' + formatDate(data.message.created_at) + ']</p>');
};

function formatDate (date) {
  var dateObj = new Date(date);
  var options = {
    weekday: "long", year: "numeric", month: "short",
    day: "numeric", hour: "2-digit", minute: "2-digit"
  };

  return dateObj.toLocaleTimeString('en-US', options);
};

function clearChatInputField (input) {
  input.val('');
};
