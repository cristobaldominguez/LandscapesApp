document.addEventListener("turbolinks:load", function () {
  
  function removeSearch() {
    $('.search__lists-results').hide();
    $('.search__unclick').hide();
    $('.form__filters').removeClass('form__filters--open');
  }
  
  function addSearch() {
    const body_height = Math.round($('body').height());
    document.body.style.setProperty("--body-height", body_height + 'px');

    $('.search__lists-results').show();
    $('.search__unclick').show();
    $('.form__filters').addClass('form__filters--open');
  }

  $('.cards').on('click', '.card__highlight', function(event) {
    const card__data = $(this).next().find('.card__data');
    const card_hidden = $(this).next().find('.card__hidden');
    const height = card__data.outerHeight(true) + 'px';
    card_hidden.get(0).style.setProperty("--current-height", height);

    $(this).parent().toggleClass('card--open');
  });

  $('.cards').on('click', '.card__like', function(event) {
    event.stopPropagation();
    event.preventDefault();

    $(this).toggleClass('card__like--red');
  });

  $('.cards').on('click', '.card__follow-btn', function(event) {
    event.stopPropagation();
  });
  
  $('.cards').on('mouseenter mouseleave', '.card__author-following', function(event) {
    const new_text = event.type === 'mouseenter' ? 'Unfollow' : 'Following';
    $(event.target).text(new_text);
  });
  
  $('.cards').on('click', '.comment__like', function(event) {
    event.preventDefault();
    $(this).toggleClass('comment__like-liked');
  });
  
  $('body').on('click', '.search__unclick', function(event) {
    event.preventDefault();
    removeSearch();
  });

  $('body').on('focus', '.form__input', function(event) {
    addSearch();
  });

  const card_form = $('.card_form__picture')
  if (card_form.length > 0) {
    card_form.get(0).style.setProperty("--card-form-height", card_form.width() + 'px');
  }

})
