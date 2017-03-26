// $('.confirm').on('click', '#post-button', function(){
//     $.ajax(''), {
//       success: function(response)
//         $('')
//     }
//   // $(this).find('#pic-created').slideDown();
//   });
// });

  $('.confirm').submit(function (e) {
    e.preventDefault();
    var getData = $(this).serialize(); //grabs data from form input
    var formURL = $(this).attr('action');
    $.ajax({
      url: formURL,
      type: 'GET',
      data: getData,
      success: function (data, textStatus, jqXHR) {
        $('SearchForm').append(data).fadeIn(2000); //this is the JS that gets triggered in response to a successful return. Data is what was returned.
      },
      error: function (jqXHR, textStatus, errorThrown) {
      }
    });
    $(document).submit();
  });

  function test(json) {
    console.log('Hello from JSON');
    console.log(json);
  }
