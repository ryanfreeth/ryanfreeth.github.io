import hljs from 'highlight.js';
import 'tracking';
import 'zen';
import 'enhance';

hljs.initHighlightingOnLoad();

$(function() {
  $.zen(function(toBe) { $('#zen').find('.enlightenment').text(toBe); });

  $('.top-bar').on('click', '.menu-icon a', function(e) {
    e.preventDefault();
    $(e.delegateTarget).toggleClass('expanded');
  });
});

if (__DEVELOPMENT__) {
  console.log("Running in development mode!");
}

if (__DEBUG__) {
  console.log("Running in debug mode!");
}

if (__BUILD__) {
  console.log("Welcome to ryanfreeth.com!");
}
