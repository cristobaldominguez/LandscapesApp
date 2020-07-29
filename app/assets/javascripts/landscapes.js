document.addEventListener("turbolinks:load", function () {
  const dropzone_enabled = document.querySelector('#dropzone')

  if (dropzone_enabled) {
    const thumbnailDimensions = $('.card_form__picture-span').width()

    const dropzoneNewLandscape = new Dropzone(dropzone_enabled, {
      method: 'post',
      url: '/landscapes',
      acceptedFiles: 'image/*',
      autoProcessQueue: false,
      paramName: 'landscape[image]',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      thumbnailWidth: thumbnailDimensions,
      thumbnailHeight: thumbnailDimensions
    });

    dropzoneNewLandscape.on("sending", function (file, xhr, formData) {
      const title = $('#landscape-title').val();
      const description = $('#landscape-description').val();
      formData.append('landscape[title]', title);
      formData.append('landscape[description]', description);
    });

    $('#btn-form-landscape-new-submit').click(() => {
      dropzoneNewLandscape.processQueue();
    });
  }

});