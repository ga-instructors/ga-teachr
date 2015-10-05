jQuery ->
  updateForm = (slide) ->
    if $('#survey_question_open_ended:checked').length
      $('.open_end').slideDown(slide);
    else
      $('.open_end').slideUp(slide);

    if $('#multiple_choice:checked').length
      $('form > .field.open_end').animate({'margin-left': '40px'})
      $('.field.options').slideDown(slide);
    else
      $('form > .field.open_end').animate({'margin-left': ''})
      $('.field.options').slideUp(slide);

  $(document).on 'change', '#survey_question_open_ended', ->
    if $('#multiple_choice:checked').length + $('#survey_question_open_ended:checked').length == 0
      $('#multiple_choice').prop('checked', true);
    updateForm()
  $(document).on 'change', '#multiple_choice', ->
    if $('#multiple_choice:checked').length + $('#survey_question_open_ended:checked').length == 0
      $('#survey_question_open_ended').prop('checked', true);
    updateForm()
  $(document).on 'page:load', -> updateForm(0)
  updateForm(0)
