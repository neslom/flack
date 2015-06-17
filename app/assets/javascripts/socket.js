$(document).ready(function () {
  //var mainSocket = io('http://localhost:3000/main');
  var host = 'http://localhost:3000';
  var path = window.location.pathname;
  var channel = io(host + path);

  console.log(channel);

  channel.on('message', function (message) {
    console.log('path: ' + path.slice(1));
    message = JSON.parse(message);
    appendMessageToRoom ($('.messages'), message);
  });
});
