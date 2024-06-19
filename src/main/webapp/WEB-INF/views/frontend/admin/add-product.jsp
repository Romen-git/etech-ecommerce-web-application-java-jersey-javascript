<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="adminbase">
    <layout:put block="datepicker" type="REPLACE">
        <link rel="stylesheet" href="${BASE_URL}assets/css/jquery-ui.min.css" type="text/css"/>
    </layout:put>
    <layout:put block="admincontent" type="REPLACE">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Add Product</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">

                                <div class="form-group mb-3">
                                    <label
                                            for="name"
                                    >Product Name
                                    </label>
                                    <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            class="form-control validate"
                                            required
                                    />
                                </div>
                                <div class="form-group mb-3">
                                    <label for="description">Description</label>
                                    <textarea
                                            id="description"
                                            class="form-control validate"
                                            rows="3"
                                            required
                                    ></textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label
                                            for="category"
                                    >Category</label
                                    >
                                    <select
                                            class="custom-select tm-select-accounts"
                                            id="category"
                                    >
                                        <option selected>Select category</option>

                                    </select>
                                </div>
                                <div class="row">
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                                for="price"
                                        >Price
                                        </label>
                                        <input
                                                id="price"
                                                name="expire_date"
                                                type="text"
                                                class="form-control validate"
                                                data-large-mode="true"
                                        />
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                                for="stock"
                                        >Units In Stock
                                        </label>
                                        <input
                                                id="stock"
                                                name="stock"
                                                type="text"
                                                class="form-control validate"
                                                required
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="image-dev mx-auto ">
                                    <div id="image-dev">

                                    </div>

                                </div>

                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase" id="add-product">
                                    Add Product Now
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${assets}/js/spartan-multi-image-picker1.js"></script>

        <script>
            $("#image-dev").spartanMultiImagePicker({
                fieldName: 'file[]',
                maxCount: 2,
            });


        </script>
        <script src="${assets}/js/script2.js"></script>
    </layout:put>
    <layout:put block="jqueryui" type="REPLACE">
        <script src="${BASE_URL}assets/js/jquery-ui.min.js"></script>
    </layout:put>
    <layout:put block="adminscript" type="REPLACE">
        <!--<script src="${assets}/js/spartan-multi-image-picker.js"></script>-->

        <script>
            $(function () {
                $("#expire_date").datepicker();
            });


            /*$('#image-dev').spartanMultiImagePicker({
                fieldName: 'file[]',
                maxCount: 2,


            });

            document.querySelector('#add-product').addEventListener('click', (evt) => {
                evt.preventDefault();
                let productName = document.querySelector('#name').value;
                let productPrice = document.querySelector('#price').value;
                let selectedCategory = document.querySelector('#category');
                let productCategory = selectedCategory.options[selectedCategory.selectedIndex].text;
                let productDescription = document.querySelector('#description').value;
                let productStock = document.querySelector('#stock').value;
                console.log(productDescription)

                fetch('${BASE_URL}admin/api/product', {
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    method: 'post',
                    body: JSON.stringify({
                        name: productName,
                        price: productPrice,
                        description: productDescription,
                        category: productCategory,
                        stock: productStock
                    })
                }).then(response => response.text())
                    .then( data => {
                         uploadImages(data);
                    })
            });*/


            function loadCategories() {

                fetch('${BASE_URL}admin/api/product/category')
                    .then(response => response.json())
                    .then(data => {
                        let select = document.querySelector('#category');
                        select.innerHTML = "";
                        //document.querySelector('#table-products tbody').innerHTML = "";
                        let defaultOption = document.createElement('option');
                        defaultOption.innerHTML = "Select Category";
                        defaultOption.selected = true;
                        select.add(defaultOption);
                        data.forEach(category => {
                            let option = document.createElement('option');
                            option.value = category.id;
                            option.innerHTML = category.name;
                            select.add(option);
                        });

                    });

            }

            loadCategories();


        </script>
        <!--<script>
        function uploadImages(id) {

        let formData = new FormData();
        let inputs = document.querySelectorAll('input[type=file]');
        inputs.forEach( (input, index) => {
        /*if (index !== 0 && index !== inputs.length - 1) {
        let file = input.files[0];
        formData.append("file[]", file);
        }*/
        let file = input.files[0];
        formData.append("file[]", file);
        });


        fetch('${BASE_URL}admin/api/product/'+id+'/upload-image', {
        headers: {
        'Content-Type': 'multipart/form-data',
        'Accept': 'multipart/form-data'
        },
        method: 'post',
        body: formData
        }).then(response => response.json())
        .then(data => {
        console.log(data);
        window.location.href = '${BASE_URL}admin/product';
        }).catch(error => {
        console.error('Error:', error);
        });
        }
        </script>-->


    </layout:put>
</layout:extends>
