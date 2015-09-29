jQuery ->
  $(document).on 'dragstart', '#cohort_students', (event) ->
    $('#students_content').hide();
    $('#groups_ui li').removeClass('hover active');
    $('#groups_ui').show();
  $(document).on 'dragend', '#cohort_students', (event) ->
    $('#students_content').show();
    $('#groups_ui').hide();
  $(document).on 'dragover', '#groups_ui li', (event) ->
    $(this).siblings().removeClass('hover active');
    $(this).prevAll().addClass('hover');
    $(this).addClass('active');
