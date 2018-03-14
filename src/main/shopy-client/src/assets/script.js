$(document).ready(function() {
    var checkSticky = setInterval(function() {
        var sticky = $('.sticky');
        if (sticky.length > 0) {
            var stickyOffset = sticky.offset().top;

            $(window).scroll(function() {
                var scroll = $(window).scrollTop(),
                    productsElement = $('#products-list_component');

                if (scroll >= stickyOffset) {
                    sticky.addClass('fixed');
                    productsElement.addClass('padding-top-155');
                } else {
                    sticky.removeClass('fixed');
                    productsElement.removeClass('padding-top-155');
                }
            });
            clearInterval(checkSticky);
        }
    }, 1000);

    $('.product-container-item').each(function(el, index) {
        $(el).on('mouseenter', function() {
            $(el).addClass('fadeIn');
        });
    });
});
