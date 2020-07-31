document.addEventListener("DOMContentLoaded", function () {
  const dropzone_enabled = document.querySelector('#dropzone')

  if (dropzone_enabled) {
    const thumbnailDimensions = $('.card_form__picture-span').width()

    const dropzoneNewLandscape = new Dropzone(dropzone_enabled, {
      method: 'post',
      url: '/landscapes',
      acceptedFiles: 'image/*',
      autoProcessQueue: false,
      paramName: 'landscape[image]',
      previewTemplate: document.querySelector('#tpl').innerHTML,
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

    // After the landscape is created, then we redirect to my profile view
    dropzoneNewLandscape.on("success", function () {
      alert('Landscape creado correctamente!!');
      window.location = "/users/profile";
    });

    // After the landscape is created, then we redirect to my profile view
    dropzoneNewLandscape.on("canceled", function () {
      alert('Oops! Ocurrió un error, intente nuevamente');
    });

    $('#btn-form-landscape-new-submit').click(() => {
      dropzoneNewLandscape.processQueue();
    });
  }
});