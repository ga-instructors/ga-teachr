jQuery ->
  $(document).on 'keyup', '#groups_grouping_target_group_size', (event) ->
    if event.which == 38 || event.which == 40
      $.ajax this.location,
        data: $(this).serialize(),
        dataType: 'script'
