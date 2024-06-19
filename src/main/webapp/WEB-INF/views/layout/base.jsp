<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>
<!DOCTYPE html>
<!--
ustora by freshdesignweb.com
Twitter: https://twitter.com/freshdesignweb
URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ETech</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${BASE_URL}assets/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${BASE_URL}assets/css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${BASE_URL}assets/css/owl.carousel.css">
    <link rel="stylesheet" href="${BASE_URL}assets/style.css">
    <link rel="stylesheet" href="${BASE_URL}assets/css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<jsp:include page="../frontend/include/header.jsp"/>

<layout:block name="contents">

</layout:block>
<jsp:include page="../frontend/include/footer.jsp"/>







<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="${BASE_URL}assets/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="${BASE_URL}assets/js/owl.carousel.min.js"></script>
<script src="${BASE_URL}assets/js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="${BASE_URL}assets/js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="${BASE_URL}assets/js/main.js"></script>

<!-- Slider -->
<script type="text/javascript" src="${BASE_URL}assets/js/bxslider.min.js"></script>
<script type="text/javascript" src="${BASE_URL}assets/js/script.slider.js"></script>

<script>
    const BASE_URL=${BASE_URL};

    function secureFetch(url, options = {}) {
        const token = localStorage.getItem("accessToken");
        const expireIn = localStorage.getItem("expireIn");

        const expireAt = new Date(Number(expireIn)).getTime();
        const expireGate = new Date().getTime() + 2 * 60 * 1000;

        if (token && expireAt && expireAt < expireGate) {
            return refreshToken().then(newToken => {
                options.headers = {
                    ...options.headers,
                    Authorization: 'Bearer ' + newToken
                }

                return fetch(url, options);
            })
        }

        if (token) {
            options.headers = {
                ...options.headers,
                Authorization: 'Bearer ' + token
            }
        } else {
            console.log("Token Unavailable");
            window.location.href = "${BASE_URL}login"
        }

        return fetch(url, options);

    }

    function refreshToken() {
        const oldRefreshToken = localStorage.getItem("refreshToken");

        const fromData = new URLSearchParams();
        fromData.append('token', oldRefreshToken);

        if (oldRefreshToken) {
            return fetch("${BASE_URL}login/refresh-token", {
                method: 'post',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: fromData
            }).then(response => {
                if (!response.ok) {
                    window.location.href = "${BASE_URL}login"
                }
                return response.json();
            }).then(data => {
                localStorage.setItem("accessToken", data.accessToken);
                localStorage.setItem("refreshToken", data.refreshToken);
                localStorage.setItem("expireIn", data.expireIn);
                return data.accessToken;
            });
        } else {
            localStorage.removeItem("accessToken");
            localStorage.removeItem("expireIn");
            window.location.href = "${BASE_URL}login"
        }

    }


    document.querySelector('.btn-wishlist').addEventListener('click', (evt)=>{
        secureFetch('${BASE_URL}api/category',{
            headers:{
                'Content-Type':'application/json'
            }
        }).then(response=> response.text())
            .then(data=>{
                console.log(data)
            })
    });
</script>
<layout:block name="script">

</layout:block>
</body>
</html>