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

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="account-sidebar">
                        <h3>Account</h3>
                        <ul>
                            <li><a href="${BASE_URL}account" id="personal_information">Personal Information</a></li>
                            <li><a href="${BASE_URL}account/orders" id="order_history">Order History</a></li>
                            <li><a href="${BASE_URL}account/settings" id="account_settings">Account Settings</a></li>
                            <li><a href="${BASE_URL}account/logout" id="logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="account-content">
                        <h2>Account Dashboard</h2>
                        <div class="account-details" >
                            <h3>Personal Information</h3>
                            <p>Name: ${sessionScope.get("user").getFirstname()}</p>
                            <p>Email: ${sessionScope.get("user").getEmail()}</p>
                            <a href="${BASE_URL}account/settings" class="btn btn-primary" style="margin-bottom: 30px">Edit</a>
                        </div>
                        <div class="order-history mt-3">
                            <h3>Order History</h3>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>12345</td>
                                    <td>2023-01-15</td>
                                    <td>Completed</td>
                                    <td>$150.00</td>
                                    <td><a href="${BASE_URL}account/orders/12345" class="btn btn-info">View</a></td>
                                </tr>
                                <tr>
                                    <td>12346</td>
                                    <td>2023-02-20</td>
                                    <td>Pending</td>
                                    <td>$200.00</td>
                                    <td><a href="${BASE_URL}account/orders/12346" class="btn btn-info">View</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="account-settings">
                            <h3>Account Settings</h3>
                            <p>Manage your personal information, password, and addresses.</p>
                            <a href="${BASE_URL}account/settings" class="btn btn-primary" style="margin-bottom: 30px">Manage
                                Settings</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>