<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>

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
                            <a href="${BASE_URL}cart">Cart - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i>
                                <span class="product-count">5</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
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
        </div> <!-- End mainmenu area -->

        <div class="account-details" style="margin-top: 20px;">
            <div class="container">
                <h3>Personal Information</h3>
                <form action="${BASE_URL}account/update" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstname" name="firstname" value="${sessionScope.get("user").getFirstname()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" name="email" value="${sessionScope.get("user").getEmail()}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </layout:put>
</layout:extends>