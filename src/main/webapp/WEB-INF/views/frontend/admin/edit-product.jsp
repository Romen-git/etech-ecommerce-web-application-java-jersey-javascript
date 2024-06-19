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
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
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
                                    />
                                </div>
                                <div class="form-group mb-3">
                                    <label
                                            for="description"
                                    >Description</label
                                    >
                                    <textarea
                                            id="description"
                                            class="form-control validate tm-small"
                                            rows="5"
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
                                        <option>Select category</option>

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
                                        />
                                    </div>
                                </div>

                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="image-dev mx-auto">
                                    <div id="image-dev">

                                    </div>
                                </div>

                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase "
                                        id="update-product">Update Now
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="${assets}/js/script3.js"></script>
        <script src="${assets}/js/spartan-multi-image-picker.js"></script>
        <script>
            $('#image-dev').spartanMultiImagePicker({
                fieldName: 'file[]',
                maxCount: 2,
                onAddRow: function () {

                    itemsNo = document.querySelectorAll('input[type=file]').length;
                },
                onRemoveRow: function () {

                    itemsNo = document.querySelectorAll('input[type=file]').length;
                }
            });
        </script>
    </layout:put>
    <layout:put block="jqueryui" type="REPLACE">
        <script src="${BASE_URL}assets/js/jquery-ui.min.js"></script>
    </layout:put>
    <layout:put block="adminscript" type="REPLACE">
        <script>
            $(function () {
                $("#expire_date").datepicker({
                    defaultDate: "10/22/2020"
                });
            });


        </script>
    </layout:put>
</layout:extends>


