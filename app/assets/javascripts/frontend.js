document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');

  $('#text-analyzer').submit((event) => {
    event.preventDefault();
    let text = event.target.children[0].value;
    call(text);
  });

  $('#random').click((event) => {
    call('random');
  });

  const call = (text) => {
    $.ajax({
      url: 'api/text_analyzer',
      method: 'GET',
      data: { text },
      success: (data) => handleSuccess(data),
      error: (data) => console.log(data.responseJSON[0])
    });
  };

  const handleSuccess = (data) => {
    const result = document.getElementById('results');
    result.innerHTML  = data[0];
  };
});
