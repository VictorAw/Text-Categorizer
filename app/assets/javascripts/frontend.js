document.addEventListener('DOMContentLoaded', function() {
  var root = document.getElementById('root');

  $('#text-analyzer').submit(function(event) {
    event.preventDefault();
    var text = event.target.children[0].value;
    call(text);
  });

  $('#random').click(function(event) {
    call('random');
  });

  var call = function(text) {
    $.ajax({
      url: 'api/text_analyzer',
      method: 'GET',
      data: { text: text },
      success: function(data) { handleSuccess(data) },
      error: function(data) { console.log(data.responseJSON[0]) }
    });
  };

  var handleSuccess = function (data) {
    var result = document.getElementById('results');
    result.innerHTML = "Text: " + data[1] + "Text type is: " + data[0];
  };
});
