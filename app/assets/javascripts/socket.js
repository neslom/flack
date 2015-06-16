$(document).ready(function () {
  var mainSocket = io('http://localhost:3000/main');

  //alert(window.location.pathname);

  mainSocket.on('message', function (message) {
    console.log(message);
  });
});
