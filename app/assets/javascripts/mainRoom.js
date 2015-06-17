$(document).ready(function () {
  var $mainChatBox = $('.messages.main');

  $.getJSON('/main_chat.json', function (data) {
    data.forEach(function (message) {
      appendMessageToRoom($mainChatBox, JSON.parse(message));
    });
  });
});
