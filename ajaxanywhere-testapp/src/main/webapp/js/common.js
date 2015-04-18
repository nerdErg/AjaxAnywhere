var x,y;

$(function () {
    $('body').mousemove(function (e) {
        x = e.pageX;
        y = e.pageY;
    });

    $(document).ajaxStart(
        function (e) {
            $('#spinner').css('left', x);
            $('#spinner').css('top', y).show();
            $('body').css('cursor', 'wait');
        }).ajaxComplete(function () {
            $('#spinner').hide();
            $('body').css('cursor', 'auto');
        });

    $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$('[name="'+this.hash.substring(1)+'"]').offset().top - 50}, 500)
    });

    $(document).on("click","a.closeCode", function () {
        $(this).closest("div.codeLayer").hide();
    });

    $('#grails-plugin').popover({
        content: 'We are currently working on a plugin that will make life even easier for Grails developers',
        title: '<h4><strong>Coming soon!!!</strong></h4>',
        placement: 'bottom',
        html: true,
        delay: {hide: 2000}

    });

    if ($().tocify) {
        //Calls the tocify method on your HTML div.
        $("#toc").tocify({
            context: '#examples',
            selectors: 'legend',
            extendPage: false,
            scrollTo: 120
        });
    }

    $('#grails-plugin').popover();
});
