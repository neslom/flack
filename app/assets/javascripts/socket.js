$(document).ready(function () {
  var socket = io('http://localhost:3000');

  socket.on('message', function (message) {
    console.log(message);
  });
});
