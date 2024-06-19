<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>ETech - Admin </title>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="${assets}/css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="${assets}/css/bootstrap2.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="${assets}/css/templatemo-style.css">

    <layout:block name="datepicker">

    </layout:block>
</head>

<body id="reportsPage">

<div class="" id="home">

    <jsp:include page="../frontend/admin/include/header.jsp"/>

    <layout:block name="admincontent">

    </layout:block>

    <jsp:include page="../frontend/admin/include/footer.jsp"/>


</div>

<script src="${BASE_URL}assets/js/jquery.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="${BASE_URL}assets/js/bootstrap2.min.js"></script>

<!-- https://getbootstrap.com/ -->
<script>
    const BASE_URL='${BASE_URL}';
</script>

<layout:block name="jqueryui">

</layout:block>

<layout:block name="adminscript">
    <script>
        $(function() {
            $(".tm-product-name").on("click", function() {
                window.location.href = "${BASE_URL}edit-product";
            });
        });
    </script>
</layout:block>


</body>
</html>
