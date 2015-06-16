var expect = chai.expect;

describe('Append message to chatroom', function () {
  beforeEach(function () {
    MagicLamp.load('main/index');
  });

  it('returns the appropriate string of html', function () {
    var data = { message: {id: 43, body: "hey", channel: "main" }, user: "markus" };

    expect($('.messages').val()).to.eq("");

    appendMessageToRoom($('.messages'), data);

    expect($('.messages').text()).to.include("hey");
    expect($('.messages').text()).to.include("markus");
  });

  xit('formats the data correctly', function () {
    // the date formatting function appears to only work in the browser
    var date = "2015-06-16T00:16:33.703Z";

    expect(formatDate(date)).to.eq('Monday, Jun 15, 2015, 6:16 PM');
  });
});
