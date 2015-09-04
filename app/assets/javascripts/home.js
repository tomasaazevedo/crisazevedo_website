$(document).ready(function(){
  $('.highlights-container').slick({
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
})