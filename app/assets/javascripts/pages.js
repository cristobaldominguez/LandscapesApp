document.addEventListener("turbolinks:load", function () {

  // Like on a Landscape
  $('.cards').on('click', '.card__like', function (event) {
    event.stopPropagation();
    event.preventDefault();

    const $this = $(this);
    const landscapeId = $(this).data('landscape-id');

    $.ajax({
      type: 'POST',
      url: '/likes',
      dataType: 'script',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      data: {
        like: {
          landscape_id: landscapeId
        }
      },
      success: function (response) {
        $this.toggleClass('card__like--red');
      }
    });
  });
});