$(function () {
    var lightbox_opt = {
        overlayOpacity: 0.6,
        imageLoading: '/edoardo/wedding/js/images/lightbox-ico-loading.gif',
        imageBtnClose: '/edoardo/wedding/js/images/lightbox-btn-close.gif'
    };

    $('a[href*="margaux-datamatrix\.png"]').lightBox(lightbox_opt);
    $('a[href*="edoardo-datamatrix\.png"]').lightBox(lightbox_opt);

    jwplayer('mediaplayer').setup({
      flashplayer: '/edoardo/wedding/js/lib/jwplayer/player.swf',
      file: '/edoardo/wedding/mp4/margaux_edoardo_2011-05-07.mp4',
      height: 512,
      width: 640,
      skin: '/edoardo/wedding/skins/glow.zip',
      controlbar: 'over'
    });
});
