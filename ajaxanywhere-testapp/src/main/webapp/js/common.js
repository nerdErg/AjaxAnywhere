
$(function () {
    $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$('[name="'+this.hash.substring(1)+'"]').offset().top - 50}, 500)
    });

    $(document).on("click","a.closeCode", function () {
        $(this).closest("div.codeLayer").hide();
    });
});
