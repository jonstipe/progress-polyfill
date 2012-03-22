$(function(){
  document.createElement('progress');
  var updatePolyfill = function(progressElem, progressBarDiv) {
    var params = $([($(progressElem).attr('max') || '1.0'), $(progressElem).attr('value')]).map(function() {
      if (/^\-?\d+(?:\.\d+)?$/.test(this)) {
	return parseFloat(this);
      }
    }).get();
    var max = params[0];
    var val = params[1];
    if (val > max) val = max;
    var amt = (val / max) * 100.0;
    progressBarDiv.style.width = amt + "%";
  };
  $('progress[value]').each(function(index) {
    var progressFrameDiv = document.createElement('div');
    var progressBarDiv = document.createElement('div');
    progressFrameDiv.appendChild(progressBarDiv);
    $(progressFrameDiv).addClass('progress-frame');
    $(progressBarDiv).addClass('progress-bar');
    updatePolyfill(this, progressBarDiv);
    this.appendChild(progressFrameDiv);
    $(this).bind("DOMAttrModified", function(event) {
      updatePolyfill(this, progressBarDiv);
    });
  });

  $('progress:not([value])').each(function(index) {
    var progressDiv = document.createElement('div');
    $(progressDiv).addClass('progress-undefined');
    this.appendChild(progressDiv);
  });
});