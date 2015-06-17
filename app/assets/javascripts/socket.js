$(document).ready(function () {
  var host = 'http://localhost:3000';
  var path = window.location.pathname;
  var channel = io(host + path);

  console.log(channel);

  channel.on('message', function (message) {
    console.log('path: ' + path.slice(1));
    appendMessageToRoom ($('.messages'), JSON.parse(message));
  });
});
