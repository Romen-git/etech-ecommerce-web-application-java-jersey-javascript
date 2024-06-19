<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <c:choose>
                            <c:when test="${user ne null}">
                                <li><a href="${BASE_URL}account"><i class="fa fa-user"></i> My Account</a></li>
                            </c:when>
                        </c:choose>

                        <li><a href="${BASE_URL}wishlist" class="btn-wishlist"><i class="fa fa-heart"></i> Wishlist</a></li>
                        <li><a href="${BASE_URL}cart"><i class="fa fa-user"></i> My Cart</a></li>
                        <li><a href="${BASE_URL}checkout"><i class="fa fa-user"></i> Checkout</a></li>
                        <c:choose>
                            <c:when test="${user ne null}">
                                <li><a href="${BASE_URL}login"><i class="fa fa-user"></i> Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${BASE_URL}login"><i class="fa fa-user"></i> Sign In</a></li>
                                <li><a href="${BASE_URL}signup"><i class="fa fa-user"></i> Register</a></li>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <li class="dropdown dropdown-small">
                            <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span
                                    class="key">currency :</span><span class="value">USD </span><b
                                    class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">USD</a></li>
                                <li><a href="#">INR</a></li>
                                <li><a href="#">GBP</a></li>
                            </ul>
                        </li>

                        <li class="dropdown dropdown-small">
                            <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span
                                    class="key">language :</span><span class="value">English </span><b
                                    class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">English</a></li>
                                <li><a href="#">French</a></li>
                                <li><a href="#">German</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End header area -->