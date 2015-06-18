$(document).ready(function () {
  var $mainChatBox = $('.messages.main');
  var $rockChatBox = $('.messages.rock');

  $.getJSON('/main_chat.json', function (data) {
    data.forEach(function (message) {
      appendMessageToRoom($mainChatBox, JSON.parse(message));
    });
  });

  $.getJSON('/genres/rock.json', function (data) {
    data.forEach(function (message) {
      appendMessageToRoom($rockChatBox, JSON.parse(message));
    });
  });
});
