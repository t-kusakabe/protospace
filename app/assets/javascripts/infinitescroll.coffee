$ ->
  $container = $('#prototypes')
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: '.prototype',
      isAnimated: true,
      isFitWidth: true,
      animationOptions:
        duration: 600,
        easing: 'linear'


    $('#prototypes .page').infinitescroll
      loading:
        img: 'http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif'
        msgText: 'ロード中...'

      navSelector: 'nav.pagination'
      nextSelector: 'nav.pagination a[rel=next]'
      itemSelector: '#prototypes .prototype'
      ,
      (newElements) ->
        $newElems = $(newElements).css opacity: 0
        $newElems.imagesLoaded ->
          $newElems.animate opacity: 1
          $container.masonry 'appended', $newElems, true
