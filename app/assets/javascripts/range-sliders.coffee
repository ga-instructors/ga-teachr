jQuery ->
  update_sliders = ->
    # Cache this for efficiency
    el = $(this)
    value = parseFloat(el.val())
    max = parseFloat(el.attr('max'))
    min = parseFloat(el.attr('min'))
    if max == 1 && min == 0 && value > 0
      f = new Fraction(parseFloat(el.val()), 1);
      label = if value == 1 then "&nbsp;&nbsp;✔" else "#{f.numerator}/#{f.denominator}"
    else
      label = el.val()

    # Update output
    el
     .css('background-image', "-webkit-linear-gradient(top left, #F8F8F8 #{value / max * 100}%, white #{value / max * 100}%)")
     .next('output')
     .html(label);

  # Select all range inputs, watch for change
  $(document)
    .on 'change', "input[type='range']", update_sliders
    .on 'ready page:load', ->
      $("input[type='range']").map (i, range) ->
        update_sliders.call(range)
