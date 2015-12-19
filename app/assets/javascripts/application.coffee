#= require jquery
#= require jquery_ujs
#= require jquery.fullscreen-min
#= require turbolinks
#= require velocity
#= require_tree .

jQuery ->

  # Instructs "tab" in textarea to insert 2 spaces instead of changing focus
  $(document).on 'keydown', 'textarea', (event) ->
    keycode = event.keyCode || event.which
    if keycode == 9
      event.preventDefault()
      start = this.selectionStart
      this.value = this.value.slice(0, start)+"  "+this.value.slice(this.selectionEnd)
      this.selectionStart = start + 2
      this.selectionEnd = this.selectionStart

  fullscreenElement = null
  $(document).on 'fullscreenchange', (event) ->
    element = $(document).fullScreen()
    if element
      fullscreenElement = element;
      $(fullscreenElement).css({width: "100%", height: "100%"})
    else
      $(fullscreenElement).css({width: "", height: ""})