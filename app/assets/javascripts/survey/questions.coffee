jQuery ->
  $(document).on 'keyup', (keyup) ->
    focusTag = document.activeElement.tagName.toLowerCase()
    if focusTag != 'textarea' && focusTag != 'input'
      if keyup.which == 37 && (prev_link = $('a[rel=prev]')).length
        Turbolinks.visit(prev_link.focus().attr('href'))
      else if keyup.which == 39 && (next_link = $('a[rel=next]')).length
        Turbolinks.visit(next_link.focus().attr('href'))

  updateForm = (slide) ->
    if $('#survey_question_open_ended:checked').length
      $('.open_end').slideDown(slide)
    else
      $('.open_end').slideUp(slide)

    if $('#survey_question_multiple_choice:checked').length
      $('form > .field.open_end').animate({'margin-left': '40px'})
      $('.field.options').slideDown(slide)
    else
      $('form > .field.open_end').animate({'margin-left': ''})
      $('.field.options').slideUp(slide)

  $(document).on 'change', '#survey_question_open_ended', ->
    if $('#survey_question_multiple_choice:checked').length + $('#survey_question_open_ended:checked').length == 0
      $('#survey_question_multiple_choice').prop('checked', true)
    updateForm()
  $(document).on 'change', '#survey_question_multiple_choice', ->
    if $('#survey_question_multiple_choice:checked').length + $('#survey_question_open_ended:checked').length == 0
      $('#survey_question_open_ended').prop('checked', true)
    updateForm()
  $(document).on 'page:load', -> updateForm(0)
  updateForm(0)

  # Adding new options
  $(document).on 'keypress', '.question__option:visible:last input[type=text]', (e) ->
    $this = $(this)
    console.log(e)
    if $this.val() == ""
      $option = $this.closest('li.question__option')
      $clone = $option.clone().hide()
      $clone.find('input[name^="survey_question[options_attributes]"]').each (i, input) ->
        $input = $(input)
        $input.attr('name', $input.attr('name').replace(/\[options_attributes\]\[[0-9]+\]/, '[options_attributes]['+$('li.question__option').length+']'))
        $clone.insertAfter($option).slideDown()

  # Deleting options
  $(document).on 'keydown', '.question__option .question__option_label', (e) ->
    $this = $(this)
    if e.keyCode == 8 && $this.val() == ""
      return if $('li.question__option:visible').length == 1
      $option = $this.closest('li.question__option')
      $option.find('input.question__option__destroy').val(1)

      $focusTarget = $option.prevAll('li.question__option:first')
      console.log($focusTarget, $option.next('li.question__option'))

      $focusTarget = $option.next('li.question__option') if $focusTarget.length == 0
      $focusTarget.find('.question__option_label').focus()
      $option.slideUp()
      e.preventDefault()

