<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="section-title">Product Categories</h2>
                    <div class="row" id="category-list">
                        <!-- Categories will be loaded here dynamically -->
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
    <layout:put block="script" type="REPLACE">
        <script>
            function loadCategories() {
                fetch('${BASE_URL}api/product/category')
                    .then(response => response.json())
                    .then(data => {
                        let container = document.querySelector('#category-list');
                        container.innerHTML = "";
                        data.forEach(category => {
                            let div = document.createElement('div');
                            div.className = 'col-sm-6 col-md-4 col-lg-3';
                            div.innerHTML = `
                                <div class="category-item">
                                    <h3>${category.name}</h3>
                                    <a href="${BASE_URL}category/${category.id}" class="btn btn-primary">View Products</a>
                                </div>
                            `;
                            container.appendChild(div);
                        });
                    });
            }
            loadCategories();
        </script>
    </layout:put>
</layout:extends>
