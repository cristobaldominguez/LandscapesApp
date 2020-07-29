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
    },
  });


  $('#btn-form-landscape-new-submit').click(() => {
    Dropzone.options.dropzoneNewLandscape = {
      init: function () {
        this.on("addedfile", function (file) { alert("Added file."); });
      }
    }
    dropzoneNewLandscape.processQueue();
  });
});