var expect = chai.expect;

describe('Append message to chatroom', function () {
  beforeEach(function () {
    MagicLamp.load('main_chat/index');
  });

  it('returns the appropriate string of html', function () {
    var data = { message: { id: 43, body: "hey", channel: "main" }, user: "markus" };

    expect($('.messages').val()).to.eq("");

    appendMessageToRoom($('.messages'), data);

    expect($('.messages').text()).to.include("hey");
    expect($('.messages').text()).to.include("markus");
    expect($('.message').text()).to.be.empty;
  });

});
