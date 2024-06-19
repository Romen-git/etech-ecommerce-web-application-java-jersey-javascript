<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>

<layout:extends name="base2">
    <layout:put block="content2" type="REPLACE">
        <section class="signin-page account">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="block text-center">
                            <a class="logo" href="index.html">
                                <img src="${BASE_URL}assets/img/logo.png" alt="">
                            </a>
                            <h2 class="text-center">Welcome Back</h2>
                            <form class="text-left clearfix">
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" id="email_2">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Password" id="password_2">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-main text-center login1">Login</button>
                                </div>
                            </form>
                            <p class="mt-20">New in this site ?<a href="${BASE_URL}signin"> Create New Account</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </layout:put>
    <layout:put block="script2" type="REPLACE">

        <script type="text/javascript">
            document.querySelector('.login1').addEventListener('click', async function (event) {

                event.preventDefault();

                let email = document.querySelector("#email_2").value;
                let password = document.querySelector("#password_2").value;

                try {
                    const response = await fetch('${BASE_URL}login', {
                        method: 'post',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            email: email,
                            password: password
                        })
                    });

                    if (!response.ok) {
                        const text = await response.text();
                        console.log(text);
                    } else {
                        const data = await response.json();
                        localStorage.setItem("accessToken", data.accessToken);
                        localStorage.setItem("refreshToken", data.refreshToken);
                        localStorage.setItem("expireIn", data.expireIn);
                        window.location.href = "${BASE_URL}home";
                    }
                } catch (error) {
                    console.error('err:', error);
                }

            });
        </script>
    </layout:put>
</layout:extends>