# Progress polyfill

This is a polyfill for implementing the HTML5 `<progress>` element in browsers that do not currently support it.

# Usage

Using it is easy — simply include the `progress-polyfill.js` file in the HEAD of the HTML page. You can then use `<progress>` elements normally.

The script will look through each `<progress>` element on the page and construct its own graphical meter using two `<div>` elements. This is then added as a child of the `<progress>` element, to serve as a fallback. Browsers that support `<progress>` elements will still show them natively, while browsers that don't support them will instead show our `<div>` meters.

A default css file is provided. You may edit this file to style the meters to make them look the way you want.

## Manual usage

The script can also be called manually as a jQuery plugin for elements dynamically generated through script. Simply call the `.html5Progress()` method on any jQuery object containing one or more `<progress>` elements.

## Dependencies

This script requires only the jQuery[http://jquery.com/] library.

## Demo

http://jonstipe.github.com/progress-polyfill/demo.html

## License (MIT)
Copyright (c) 2011 Jonathan Stipe

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.