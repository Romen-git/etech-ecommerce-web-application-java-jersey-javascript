<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="adminbase">

  <layout:put block="admincontent" type="REPLACE">

    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Category</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">

                <div class="form-group mb-3">
                  <label
                          for="categoryname"
                  >Category Name
                  </label>
                  <input
                          id="categoryname"
                          name="name"
                          type="text"
                          class="form-control validate"
                          required
                  />
                </div>



              </div>

              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase" id="add-category">
                  Add Category Now
                </button>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>

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


  </layout:put>
</layout:extends>
