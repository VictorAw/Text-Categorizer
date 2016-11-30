document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');

  $('#text-analyzer').submit((event) => {
    let text = event.target.children[0].value;
    call(text);
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
    result.innerHTML  = data;
  };
});
