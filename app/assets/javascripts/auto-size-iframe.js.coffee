updateIFrames = ->
  $('.js-auto-size-iframe').each (iframe) ->
    iframe.css('height', iframe.contents().height())


jQuery ->
  if $('.js-auto-size-iframe').length
    setInterval(updateIFrames, 2000)
