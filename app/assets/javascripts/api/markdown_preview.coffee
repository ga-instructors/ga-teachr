jQuery ->
  delayTimer = false
  duringTimer = false

  $(document).on 'keyup click', '.markdown:visible', (event) ->
    $editor = $(event.target)
    $preview = $editor.siblings('.markdown-preview')

    updateMarkdown = ->
      markdown = $editor.val()
      currentPosition = $editor[0].selectionStart

      # Find starting position
      count = 0
      tableDetected = false
      for a in [currentPosition..1] by -1
        tableDetected = a if markdown[a] == "\n" && markdown[a-1] == "|"
        count++ if markdown[a] == "\n"
        break if count > $preview.height()/40

      # Find ending position
      count = count - 9
      for z in [currentPosition..markdown.length] by 1
        count++ if markdown[z] == "\n"
        break if count > $preview.height()/60
      markdownToPreview = markdown.slice(a, z)

      # Append Header if a table is detected
      if tableDetected
        tableStart = markdown.lastIndexOf("\n|-", tableDetected)
        tableHeaderStart = markdown.lastIndexOf("\n|", tableStart-1)
        tableEnd = markdown.indexOf("|\n", tableStart)
        if tableHeaderStart < a
          if a > tableEnd
            tableHeader = markdown.slice(tableHeaderStart, tableEnd)
          else
            tableHeader = markdown.slice(tableHeaderStart, tableStart)
          markdownToPreview = tableHeader + markdownToPreview

      # Update preview with new markdown
      uri = "/api/v1/markdown-preview?text="+encodeURIComponent(markdownToPreview)
      $preview.height($editor.height())
      if $preview[0].contentWindow.Turbolinks
        $preview[0].contentWindow.Turbolinks.visit(uri)
      else
        $preview.attr('src', uri)
      duringTimer = clearTimeout(duringTimer)

    clearTimeout(delayTimer) if delayTimer
    delayTimer = setTimeout updateMarkdown, 300
    duringTimer = setTimeout updateMarkdown, 2000 unless duringTimer
