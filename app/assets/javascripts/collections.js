$(document).ready(function(){
  $('.show_collections-product_images-slick').slick({
    infinite: true,
    slidesToShow: 1,
    centerMode: true,
    centerPadding: '0px',
    arrows: false,
    dots: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 1,
          infinite: true,
          centerMode: true,
          centerPadding: '20px',
          infinite: true,
          arrows: false,
          dots: false
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          infinite: true,
          centerMode: true,
          centerPadding: '20px',
          infinite: true,
          arrows: false,
          dots: false
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
  });

  $('.show_collections-products_image-container').on('click', function(){
    var images_urls = $(this).children('img').data('productimages');
    var i = 0;
    var slick_slider = $('.show_collections-product_images-slick');
    slick_slider.slick('slickRemove', null, null, true); //remove all
    for(i = 0; i < images_urls.length; i++) {
      slick_slider.slick('slickAdd', '<div><img src="'+images_urls[i]+'"></div>');
    }
  });
})