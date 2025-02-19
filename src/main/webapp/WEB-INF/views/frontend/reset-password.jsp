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
                            <h2 class="text-center">Forgot Password</h2>
                            <form class="text-left clearfix">
                                <input type="hidden" id="token" value="${param.get("token")}">
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="New Password"
                                           id="new_password">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Confirm Password"
                                           id="confirm_password">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-main text-center login1">Reset Password
                                    </button>
                                </div>
                            </form>
                            <p class="mt-40 to-login"><a href="${BASE_URL}login">Back to Login</a></p>
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

                let token = document.querySelector("#token").value;
                let newPassword = document.querySelector("#new_password").value;
                let confirmPassword = document.querySelector("#confirm_password").value;

                if (newPassword !== confirmPassword) {
                    alert("Passwords do not match.")
                    return;
                }

                try {
                    const response = await fetch('${BASE_URL}auth/reset-password', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            token: token,
                            newPassword: newPassword,
                        })
                    });

                    if (!response.ok) {
                        const text = await response.text();
                        alert(text);
                    } else {
                        alert("Password has been Reset Successfully.")
                        window.location.href = "${BASE_URL}login";
                    }
                } catch (error) {
                    console.error('err:', error);
                }

            });
        </script>
    </layout:put>
</layout:extends>