$(function() {
    var images = ['background-home.jpg','background-home2.jpg','background-home3.jpg','background-home4.jpg','background-home5.jpg','background-home6.jpg'];
    $('.session-header').css({'background-image': 'url(images/' + images[Math.floor(Math.random() * images.length)] + ')'});
});