###
HTML5 Progress polyfill | Jonathan Stipe | https://github.com/jonstipe/progress-polyfill
###
(($) ->
  document.createElement 'progress'
  $.fn.html5Progress = ->
    updatePolyfill = (progressElem, progressBarDiv) ->
      [max, val] = $([
        ($(progressElem).attr('max') || '1.0'),
        $(progressElem).attr('value')]).map(() ->
        if /^\-?\d+(?:\.\d+)?$/.test this
  	      parseFloat this
      ).get()
      if val > max
        val = max
      amt = if (max > 0) then (val / max) * 100.0 else 0
      progressBarDiv.style.width = amt + "%"
      null

    $(this).filter('progress[value]').each ->
      $elem = $ this
      progressFrameDiv = document.createElement 'div'
      progressBarDiv = document.createElement 'div'
      progressFrameDiv.appendChild progressBarDiv
      $(progressFrameDiv).addClass 'progress-frame'
      $(progressBarDiv).addClass 'progress-bar'
      updatePolyfill this, progressBarDiv
      this.appendChild progressFrameDiv
      if (WebKitMutationObserver? || MutationObserver?)
        attrMutationCallback = (mutations, observer) =>
          (
            if mutation.type == "attributes" && mutation.attributeName in ["value", "max"]
              if $elem.is("[value]")
                updatePolyfill this, progressBarDiv
              else
                $elem.children("div.progress-frame").remove()
                attrObserver.disconnect()
                $elem.html5Progress()
          ) for mutation in mutations
          null
        attrObserver = if (WebKitMutationObserver?) then new WebKitMutationObserver(attrMutationCallback) else (if (MutationObserver?) then new MutationObserver(attrMutationCallback) else null)
        attrObserver.observe this, {
          attributes: true
          attributeFilter: ["value", "max"]
        }
      else if MutationEvent?
        attrHandler = (evt) =>
          if evt.originalEvent.attrName in ["value", "max"]
            if $elem.is("[value]")
              updatePolyfill this, progressBarDiv
            else
              $elem.children("div.progress-frame").remove()
              $elem.off "DOMAttrModified", attrHandler
              $elem.html5Progress()
          null
        $elem.on "DOMAttrModified", attrHandler
      null
  
    $(this).filter('progress:not([value])').each ->
      $elem = $ this
      progressDiv = document.createElement 'div'
      $(progressDiv).addClass 'progress-undefined'
      this.appendChild progressDiv
      if (WebKitMutationObserver? || MutationObserver?)
        attrMutationCallback = (mutations, observer) =>
          (
            if mutation.type == "attributes" && mutation.attributeName == "value" && $elem.is("[value]")
              $elem.children("div.progress-undefined").remove()
              attrObserver.disconnect()
              $elem.html5Progress()
          ) for mutation in mutations
          null
        attrObserver = if (WebKitMutationObserver?) then new WebKitMutationObserver(attrMutationCallback) else (if (MutationObserver?) then new MutationObserver(attrMutationCallback) else null)
        attrObserver.observe this, {
          attributes: true
          attributeFilter: ["value"]
        }
      else if MutationEvent?
        attrHandler = (evt) =>
          if evt.originalEvent.attrName == "value" && $elem.is("[value]")
            $elem.children("div.progress-undefined").remove()
            $elem.off "DOMAttrModified", attrHandler
            $elem.html5Progress()
          null
        $elem.on "DOMAttrModified", attrHandler
      null
    $(this)
  $ ->
    $('progress').html5Progress()
    null
  null
)(jQuery)
