jQuery ->
  $('#cohort_students').on 'dragstart', (event) ->
    $('#students_content').hide();
    $('#groups_ui li').removeClass('hover active');
    $('#groups_ui').show();
  $('#cohort_students').on 'dragend', (event) ->
    $('#students_content').show();
    $('#groups_ui').hide();
  $('#groups_ui').on 'dragover', 'li', (event) ->
    $(this).siblings().removeClass('hover active');
    $(this).prevAll().addClass('hover');
    $(this).addClass('active');
