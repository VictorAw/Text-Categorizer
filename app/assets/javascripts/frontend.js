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
    $('.narrative').removeClass('highlighted');
    $('.expository').removeClass('highlighted');
  });

  var call = function(text) {
    $.ajax({
      url: 'api/text_analyzer',
      method: 'GET',
      data: { text: text },
      success: function(data) { handleSuccess(data);},
      error: function(data) { handleError(); }
    });
  };

  var handleSuccess = function (data) {
    data = data[0];

    if(data !== 'Narrative' && data !== 'Expository'){
      $('#text').val(data);
    }

    if(data.includes('Narrative')){
      $('.narrative').addClass('highlighted');
    } else {
      $('.narrative').removeClass('highlighted');
    }

    if(data.includes('Expository')){
        $('.expository').addClass('highlighted');
      } else {
        $('.expository').removeClass('highlighted');
      }

    $('#random').prop('disabled', false);
    $('#submit').prop('disabled', false);
  };

  var handleError = function(){
    $('#text').val("Text can't be blank!");
    $('#random').prop('disabled', false);
    $('#submit').prop('disabled', false);
    $('.narrative').removeClass('highlighted');
    $('.expository').removeClass('highlighted');
  };
});
