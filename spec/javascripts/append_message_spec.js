var expect = chai.expect;

describe('Append message to chatroom', function () {
  beforeEach(function () {
    MagicLamp.load('main/index');
  });

  it('returns the appropriate string of html', function () {
    expect($('.messages').val()).to.eq("");
    var data = { message: {id: 43, body: "hey", channel: "main" }, user: "markus" };

    appendMessageToRoom($('.messages'), data);
    expect($('.messages').text()).to.include("hey");
    expect($('.messages').text()).to.include("markus");
  });
});
