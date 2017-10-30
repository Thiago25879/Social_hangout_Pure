$( document ).ready(function() {
    var heights = $(".auto-height").map(function() {
        return $(this).height();
    }).get(),

    maxHeight = Math.max.apply(null, heights);

    $(".auto-height").height(maxHeight);
});
