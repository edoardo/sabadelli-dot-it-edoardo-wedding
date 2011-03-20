$(function () {
    var lightbox_opt = {
        overlayOpacity: 0.6,
        imageLoading: '/edoardo/wedding/js/images/lightbox-ico-loading.gif',
        imageBtnClose: '/edoardo/wedding/js/images/lightbox-btn-close.gif'
    };

    $('a[href*="margaux-datamatrix\.png"]').lightBox(lightbox_opt);
    $('a[href*="edoardo-datamatrix\.png"]').lightBox(lightbox_opt);
});
