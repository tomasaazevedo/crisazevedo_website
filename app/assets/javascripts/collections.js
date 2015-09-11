$(document).ready(function(){
  $('.show_collections-product_images-slick').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    centerMode: true,
    centerPadding: '0px',
    prevArrow: $('.prev-arrow'),
    nextArrow: $('.next-arrow'),
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
    var product_info = $(this).children('img').data('productinfo');
    var i = 0;
    var slick_slider = $('.show_collections-product_images-slick');
    var pinfo_container = $('.show_collections-product_info-container');
    slick_slider.slick('slickRemove', null, null, true); //remove all
    for(i = 0; i < images_urls.length; i++) {
      slick_slider.slick('slickAdd', '<div><img src="'+images_urls[i]+'"></div>');
    }
    pinfo_container.empty();
    pinfo_container.append('<p class="product_name">'+product_info["name"]+'</p>');
    pinfo_container.append('<p class="product_description">'+product_info["description"]+'</p>');
    pinfo_container.append('<p class="product_dimensions">'+product_info["dimensions"]+'</p>');
    pinfo_container.append('<p class="product_weight">'+product_info["weight"]+'</p>');
    pinfo_container.append('<p class="product_material">'+product_info["material"]+'</p>');
    pinfo_container.append('<p class="product_code">'+product_info["product_code"]+'</p>');
  });
})