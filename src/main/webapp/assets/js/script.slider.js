(function ($) {

    // Slidder home 4
    if ($('#bxslider-home4').length > 0) {
        var slider = $('#bxslider-home4').bxSlider({
            nextText: '<i class="fa fa-angle-right"></i>',
            prevText: '<i class="fa fa-angle-left"></i>',
            auto: true,
            onSliderLoad: function (currentIndex) {
                $('#bxslider-home4 li').find('.caption').each(function (i) {
                    $(this).show().addClass('animated fadeInRight').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                        $(this).removeClass('fadeInRight animated');
                    });
                })
            },
            onSlideBefore: function (slideElement, oldIndex, newIndex) {
                //slideElement.find('.sl-description').hide();
                slideElement.find('.caption').each(function () {
                    $(this).hide().removeClass('animated fadeInRight');
                });
            },
            onSlideAfter: function (slideElement, oldIndex, newIndex) {
                //slideElement.find('.sl-description').show();
                setTimeout(function () {
                    slideElement.find('.caption').each(function () {
                        $(this).show().addClass('animated fadeInRight').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                            $(this).removeClass('fadeInRight animated');
                        });
                    });
                }, 500);
                $('#bxslider-home4 li').removeClass('active');
                slideElement.addClass('active');
            }
        });
        //slider.reloadSlider();
    }
    $(document).ready(function () {
        $('.caption.button-radius').hover(function () {
            slider.stopAuto();
        }, function () {
            slider.startAuto();
        });
    });
})(jQuery); // End of use strict