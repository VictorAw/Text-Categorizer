document.addEventListener('DOMContentLoaded', function() {
  var root = document.getElementById('root');

  $('#text-analyzer').submit(function(event) {
    event.preventDefault();
    var text = event.target.children[0].value;
    call(text);
    $('#random').prop('disabled', true);
    $('#submit').prop('disabled', true);
  });

  $('#random').click(function(event) {
    call('random');
    $('#random').prop('disabled', true);
    $('#submit').prop('disabled', true);
  });

  var call = function(text) {
    $.ajax({
      url: 'api/text_analyzer',
      method: 'GET',
      data: { text: text },
      success: function(data) { handleSuccess(data);},
      error: function(data) { console.log(data.responseJSON[0]);}
    });
  };

  var handleSuccess = function (data) {
    var result = document.getElementById('results');
    $('#text').val(data[1]);

    result.innerHTML = "Text type is: " + data[0];
    $('#random').prop('disabled', false);
    $('#submit').prop('disabled', false);
  };


});
