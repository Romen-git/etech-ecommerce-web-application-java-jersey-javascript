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
                                    class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
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
                            <li><a href="${BASE_URL}">Home</a></li>
                            <li class="active"><a href="${BASE_URL}shop">Shop</a></li>
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

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shop</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row" id="product-div">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-shop-product">
                            <div class="product-upper">
                                <img src="${BASE_URL}assets/img/product-2.jpg" alt="">
                            </div>
                            <h2><a href="">Apple new mac book 2015 March :P</a></h2>
                            <div class="product-carousel-price">
                                <ins>$899.00</ins>
                                <del>$999.00</del>
                            </div>

                            <div class="product-option-shop">
                                <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70"
                                   rel="nofollow" href="${BASE_URL}shop/?add-to-cart=70">Add to cart</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-shop-product">
                            <div class="product-upper">
                                <img src="${BASE_URL}assets/img/product-4.jpg" alt="">
                            </div>
                            <h2><a href="">Apple new mac book 2015 March :P</a></h2>
                            <div class="product-carousel-price">
                                <ins>$899.00</ins>
                                <del>$999.00</del>
                            </div>

                            <div class="product-option-shop">
                                <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70"
                                   rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="product-pagination text-center">
                            <nav>
                                <ul class="pagination" id="pagination-ul">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
    <layout:put block="script" type="REPLACE">
        <script type="text/javascript">
            function loadProducts(page = 1, size = 12) {

                fetch('/etech/api/product?page=' + page + '&size=' + size)
                    .then(response => response.json())
                    .then(data => {

                        let div = document.querySelector('#product-div');
                        div.innerHTML = "";
                        let html = '';
                        data.products.forEach(product => {
                            let innerhtml = '<div class="col-md-3 col-sm-6"> ' +
                                '<div class="single-shop-product"> ' +
                                '<div class="product-upper"> ' +
                                '<img src="/etech' + product.images[0] + '" alt=""> ' +
                                '</div> ' +
                                '<h2><a href="">' + product.name + '</a></h2> ' +
                                '<div class="product-carousel-price"> ' +
                                '<ins>$' + product.price + '</ins> <del>$999.00</del> ' +
                                '</div> ' +
                                '<div class="product-option-shop"> ' +
                                '<a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="' + product.id + '" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> ' +
                                '</div> ' +
                                '</div> ' +
                                '</div> ';
                            html = html + innerhtml;
                        });

                        div.innerHTML = html;

                        let paginationUl = document.querySelector('#pagination-ul');
                        paginationUl.innerHTML = "";

                        let previousPage = page > 1 ? page - 1 : 1;
                        let nextPage = page < data.totalPages ? page + 1 : data.totalPages;

                        let paginationHtml = '<li>' +
                            '<a href="#" aria-label="Previous" onclick="loadProducts(' + previousPage + ', ' + size + '); return false;">' +
                            '<span aria-hidden="true">&laquo;</span>' +
                            '</a>' +
                            '</li>';

                        for (let i = 1; i <= data.totalPages; i++) {
                            paginationHtml += '<li class="' + (i === page ? 'active' : '') + '">' +
                                '<a href="#" onclick="loadProducts(' + i + ', ' + size + '); return false;">' + i + '</a>' +
                                '</li>';
                        }

                        paginationHtml += '<li>' +
                            '<a href="#" aria-label="Next" onclick="loadProducts(' + nextPage + ', ' + size + '); return false;">' +
                            '<span aria-hidden="true">&raquo;</span>' +
                            '</a>' +
                            '</li>';

                        paginationUl.innerHTML = paginationHtml;

                    })
                    .catch(error => console.log("Error loading products", error));


            }

            document.addEventListener('DOMContentLoaded', function () {
                loadProducts();
            })

        </script>
    </layout:put>
</layout:extends>

