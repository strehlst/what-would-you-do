// As soon as DOM fully loaded
$( document ).on('turbolinks:load', function() {
    // Smooth scrolling
    var $root = $('html, body');
    $('a').click(function () {
        var href = $.attr(this, 'href');
        if (href != undefined && href != '#') {
            $root.animate({
                scrollTop: $(href).offset().top
            }, 500, function () {
                window.location.hash = href;
            });
        }
        return false;
    });
});
