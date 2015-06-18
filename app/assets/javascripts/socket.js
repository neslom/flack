$(document).ready(function () {
  var host;
  var windowLocation = window.location;

  if (windowLocation.toString().indexOf('45.55.184.116') !== -1) {
    host = 'http://45.55.184.116';
  } else {
    host = 'http://localhost:4200';
  };

  var path = window.location.pathname;
  var channel = io(host + path);

  console.log(channel);

  channel.on('message', function (message) {
    console.log('path: ' + path.slice(1));
    appendMessageToRoom($('.messages'), JSON.parse(message));
  });
});
