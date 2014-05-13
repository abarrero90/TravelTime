$(document).ready(function(){
    $('#addhh_img').click(function(event){
        event.preventDefault();
        form = $.get();


        var modal = $(this) // getting the div tag

        var maskHeight = '200px'
        var maskWidth = '200px'
        $('#modal_add_image').css({'width':maskWidth,'height':maskHeight});

        $('#modal_add_image').fadeIn(100);
        $('#modal_add_image').fadeTo('fast', 0.4) ;
        $('#modal_add_image').append(form);

    });

    // When Cancel button is pressed in 'adding new photo'
    $('#cancel').click(function(){
        $('#modal_add_image').hide() ;
    });
});




$('a[name=modal]').click(function(e) {
    //Cancel the link behavior
    e.preventDefault();
    //Get the A tag
    var id = $(this).attr('href');


    //Get the screen height and width
    var maskHeight = '200px'
    var maskWidth = '200px'

    //Set height and width to mask to fill up the whole screen
    $('#mask').css({'width':maskWidth,'height':maskHeight});

    //transition effect
    $('#mask').fadeIn(1000);
    $('#mask').fadeTo("fast",0.8);

    //Get the window height and width
    var winH = $(window).height();
    var winW = $(window).width();
    //Set the popup window to center
    $(id).css('top', winH/2-$(id).height()/2);
    $(id).css('left', winW/2-$(id).width()/2);

    //transition effect
    $(id).fadeIn(2000);

});