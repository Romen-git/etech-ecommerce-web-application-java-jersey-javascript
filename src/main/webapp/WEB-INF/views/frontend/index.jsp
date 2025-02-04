<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>

<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="./"><img src="${BASE_URL}assets/img/logo.png"></a></h1>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="shopping-item">
                            <a href="${BASE_URL}cart">Cart - <span class="cart-amunt">$100</span> <i
                                    class="fa fa-shopping-cart"></i>
                                <span class="product-count">5</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="${BASE_URL}">Home</a></li>
                            <li><a href="${BASE_URL}shop">Shop</a></li>
                            <li><a href="${BASE_URL}cart">Cart</a></li>
                            <li><a href="${BASE_URL}category">Category</a></li>
                            <li><a href="${BASE_URL}blog">Blog</a></li>
                            <li><a href="${BASE_URL}contact">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End mainmenu area -->

        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4">
                <ul class="" id="bxslider-home4">
                    <li>
                        <img src="${BASE_URL}assets/img/h4-slide.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                iPhone <span class="primary">6 <strong>Plus</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Dual SIM</h4>
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                    <li><img src="${BASE_URL}assets/img/h4-slide2.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                by one, get one <span class="primary">50% <strong>off</strong></span>
                            </h2>
                            <h4 class="caption subtitle">school supplies & backpacks.*</h4>
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                    <li><img src="${BASE_URL}assets/img/h4-slide3.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Apple <span class="primary">Store <strong>Ipod</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Select Item</h4>
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                    <li><img src="${BASE_URL}assets/img/h4-slide4.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Apple <span class="primary">Store <strong>Ipod</strong></span>
                            </h2>
                            <h4 class="caption subtitle">& Phone</h4>
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- ./Slider -->
        </div>
        <!-- End slider area -->

        <div class="promo-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo1">
                            <i class="fa fa-refresh"></i>
                            <p>30 Days return</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo2">
                            <i class="fa fa-truck"></i>
                            <p>Free shipping</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo3">
                            <i class="fa fa-lock"></i>
                            <p>Secure payments</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo4">
                            <i class="fa fa-gift"></i>
                            <p>New products</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End promo area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">Latest Products</h2>
                            <div class="product-carousel" id="latest-products">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End main content area -->

        <div class="brands-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="brand-wrapper">
                            <div class="brand-list">
                                <img src="${BASE_URL}assets/img/brand1.png" alt="">
                                <img src="${BASE_URL}assets/img/brand2.png" alt="">
                                <img src="${BASE_URL}assets/img/brand3.png" alt="">
                                <img src="${BASE_URL}assets/img/brand4.png" alt="">
                                <img src="${BASE_URL}assets/img/brand5.png" alt="">
                                <img src="${BASE_URL}assets/img/brand6.png" alt="">
                                <img src="${BASE_URL}assets/img/brand1.png" alt="">
                                <img src="${BASE_URL}assets/img/brand2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End brands area -->

        <div class="product-widget-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-product-widget">
                            <h2 class="product-wid-title">Top Selling</h2>
                            <a href="" class="wid-view-more">View All</a>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-1.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-2.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Apple new mac book 2015</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-3.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Apple new i phone 6</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-product-widget">
                            <h2 class="product-wid-title">Recently Viewed</h2>
                            <a href="#" class="wid-view-more">View All</a>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-4.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Sony playstation microsoft</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-1.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Sony Smart Air Condtion</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-2.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Samsung gallaxy note 4</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-product-widget">
                            <h2 class="product-wid-title">Top New</h2>
                            <a href="#" class="wid-view-more">View All</a>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-3.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Apple new i phone 6</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-4.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Samsung gallaxy note 4</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${BASE_URL}assets/img/product-thumb-1.jpg"
                                                                   alt=""
                                                                   class="product-thumb"></a>
                                <h2><a href="single-product.html">Sony playstation microsoft</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>$400.00</ins>
                                    <del>$425.00</del>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End product widget area -->
    </layout:put>

    <layout:put block="script" type="REPLACE">

        <script type="text/javascript">

            document.addEventListener("DOMContentLoaded", function () {
                function fetchLatestProducts() {
                    fetch('/etech/api/product/latest')
                        .then(response => response.json())
                        .then(data => {
                            let productContainer = document.getElementById('latest-products');
                            productContainer.innerHTML = '';
                            $(".product-carousel").trigger('destroy.owl.carousel');
                            console.log(data);
                            data.forEach(product => {
                                let productElement = document.createElement('div');
                                productElement.className = 'single-product';
                                productElement.innerHTML = '<div class="product-f-image">' +
                                    '<img class="lazy" data-src="/etech' + product.images[0] + '" alt="' + product.name + '">' +
                                    '<div class="product-hover">' +
                                    '<a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>' +
                                    '<a href="single-product.html?id=' + product.id + '" class="view-details-link"><i class="fa fa-link"></i> See details</a>' +
                                    '</div>' +
                                    '</div>' +
                                    '<h2><a href="single-product.html?id=' + product.id + '">' + product.name + '</a></h2>' +
                                    '<div class="product-carousel-price">' +
                                    '<ins>$' + product.price + '</ins> <del>$1000</del>' +
                                    '</div>';
                                productContainer.appendChild(productElement);

                                let img = productElement.querySelector('img');
                                img.onload = function () {
                                    productElement.classList.add('loaded');
                                };
                            });

                            //reinitialize Owl Carousel
                            $(".product-carousel").owlCarousel({
                                loop: true,
                                nav: true,
                                margin: 20,
                                responsiveClass: true,
                                responsive: {0: {items: 1,}, 600: {items: 3,}, 1000: {items: 5,}}
                            });

                            //initialize lazy loading for new images
                            let lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));
                            if ("IntersectionObserver" in window) {
                                let lazyImageObserver = new IntersectionObserver(function (entries, observer) {
                                    entries.forEach(function (entry) {
                                        if (entry.isIntersecting) {
                                            let lazyImage = entry.target;
                                            lazyImage.src = lazyImage.dataset.src;
                                            lazyImage.onload = function () {
                                                lazyImage.parentNode.parentNode.classList.add('loaded'); //add loaded class to single-product
                                            };
                                            lazyImage.classList.remove("lazy");
                                            lazyImageObserver.unobserve(lazyImage);
                                        }
                                    });
                                });
                                lazyImages.forEach(function (lazyImage) {
                                    lazyImageObserver.observe(lazyImage);
                                });
                            } else {
                                //fallback for older browsers
                                lazyImages.forEach(function (lazyImage) {
                                    lazyImage.src = lazyImage.dataset.src;
                                    lazyImage.onload = function () {
                                        lazyImage.parentNode.parentNode.classList.add('loaded'); //add loaded class to single-product
                                    };
                                    lazyImage.classList.remove("lazy");
                                });
                            }
                        })
                        .catch(error => console.error('Error fetching products:', error));
                }

                function fetchTopSellingProducts() {

                    fetch("/etech/api/product/top-selling")
                        .then(response => response.json())
                        .then(data => {

                            let container = document.querySelector('.single-product-widget');

                            container.innerHTML = `<h2 class="product-wid-title">Top Selling</h2> <a href="" class="wid-view-more">View All</a>`;

                            data.forEach(product => {
                                let productElement = document.createElement('div');
                                productElement.className = 'single-wid-product';

                                let ratingStars = '';
                                if (product.rating === 0) {
                                    ratingStars += '<i class="fa fa-star-o"></i>';
                                } else {

                                    for (let i = 0; i < 5; i++) {

                                        if (i < product.rating) {
                                            ratingStars += '<i class="fa fa-star"></i>';
                                        } else {
                                            break;
                                        }
                                    }

                                }

                                productElement.innerHTML = '<a href="single-product.html?id=' + product.id + '">' +
                                    '<img src="/etech' + product.image + '" alt="' + product.name + '" class="product-thumb"></a> ' +
                                    '<h2><a href="single-product.html?id=' + product.id + '">' + product.name + '</a></h2> ' +
                                    '<div class="product-wid-rating"> ' + ratingStars + ' </div> ' +
                                    '<div class="product-wid-price"> ' +
                                    '<ins>$' + product.price + '</ins> ' +
                                    '<del>$450.00</del> ' +
                                    '</div>';

                                container.appendChild(productElement);
                            });

                        })
                        .catch(error => console.error('Error fetching top selling products', error));

                }

                fetchLatestProducts();
                fetchTopSellingProducts();
            });


        </script>

    </layout:put>

</layout:extends>
