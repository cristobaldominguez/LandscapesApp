document.addEventListener("turbolinks:load", function () {
  const authenticityToken = $('meta[name="csrf-token"]').attr('content')

  const dropzoneNewLandscape = new Dropzone("#dropzone", {
    method: 'post',
    url: '/landscapes',
    acceptedFiles: 'image/*',
    autoProcessQueue: false,
    paramName: 'landscape[image]',
    headers: {
      'X-CSRF-TOKEN': authenticityToken
    }
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
});