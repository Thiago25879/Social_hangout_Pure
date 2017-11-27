$( window ).load(function() {
    var heights = $(".auto-height").map(function() {
        return $(this).height();
    }).get(),

    maxHeight = Math.max.apply(null, heights);

    $(".auto-height").height(maxHeight);
});

$( window ).load(function() {
    var widths = $(".auto-width").map(function() {
        return $(this).width();
    }).get(),

    maxWidth = Math.max.apply(null, widths);

    $(".auto-width").width(maxWidth);
});

   