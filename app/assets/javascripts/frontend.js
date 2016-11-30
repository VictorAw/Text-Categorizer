document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  // window.submitForm = document.getElementById('text-analyzer');

  $('#text-analyzer').submit(() => {
    call();
  });


  const call = () => {
    $.ajax({
      url: 'api/text_analyzer',
      method: 'GET',
      success: (data) => console.log(data)
    });
  };
});
