<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<layout:extends name="adminbase">
    <layout:put block="admincontent" type="REPLACE">
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table" id="table-products">
                                <thead>
                                <tr>
                                    <th scope="col">&nbsp;</th>
                                    <th scope="col">PRODUCT NAME</th>
                                    <th scope="col">UNIT SOLD</th>
                                    <th scope="col">IN STOCK</th>
                                    <th scope="col">PRICE</th>
                                    <th scope="col">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>


                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                                href="${BASE_URL}admin/addproduct"
                                class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                        <button class="btn btn-primary btn-block text-uppercase">
                            Delete selected products
                        </button>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">Product Categories</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table" id="table-categories">
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <button class="btn btn-primary btn-block text-uppercase mb-3" href="${BASE_URL}admin/addcategory">
                            Add new category
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
    <layout:put block="adminscript" type="REPLACE">
        <script>
            function loadProducts() {

                fetch('${BASE_URL}admin/api/product')
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-products tbody');
                        table.innerHTML = "";
                        //document.querySelector('#table-products tbody').innerHTML = "";
                        data.forEach(product => {
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.scope = 'row';
                            cell.innerHTML = '<input type="checkbox" />';
                            cell = row.insertCell();
                            cell.className = 'tm-product-name';
                            cell.innerHTML = product.name;
                            cell.onclick = (evt) => {
                                editProduct(product.id);
                            };
                            cell = row.insertCell();
                            cell.innerHTML = '1000';
                            cell.onclick = (evt) => {
                                editProduct(product.id);
                            };
                            cell = row.insertCell();
                            cell.innerHTML = product.stock;
                            cell.onclick = (evt) => {
                                editProduct(product.id);
                            };
                            cell = row.insertCell();
                            cell.innerHTML = product.price;
                            cell.onclick = (evt) => {
                                editProduct(product.id);
                            };
                            cell = row.insertCell();
                            cell.innerHTML = '<a href="#" class="tm-product-delete-link" onclick="deleteProduct('+product.id+')"> <i class="far fa-trash-alt tm-product-delete-icon"></i> </a>'
                        });

                    });
            }

            function editProduct(id) {
                window.location.href = '${BASE_URL}admin/editproduct/' + id;
            }

            function deleteProduct(id) {

                fetch('${BASE_URL}admin/api/product/' + id, {
                    method: 'delete'
                }).then(response => response.text())
                    .then(text => {
                        loadProducts();
                    });
            }

            function loadCategories() {

                fetch('${BASE_URL}admin/api/product/category')
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-categories tbody');
                        table.innerHTML = "";
                        //document.querySelector('#table-products tbody').innerHTML = "";
                        data.forEach(category => {
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.className = 'tm-product-name';
                            cell.innerHTML=category.name;
                            cell = row.insertCell();
                            cell.className = 'text-center';
                            cell.innerHTML = '<a href="#" class="tm-product-delete-link" onclick="deleteCategory('+category.id+')"> <i class="far fa-trash-alt tm-product-delete-icon"></i> </a>'
                        });

                    });
            }

            function deleteCategory(id) {
                fetch('${BASE_URL}admin/api/product/category' + id, {
                    method: 'delete'
                }).then(response => response.text())
                    .then(text => {
                        loadCategories();
                    });
            }

            loadProducts();
            loadCategories()
        </script>
    </layout:put>
</layout:extends>

