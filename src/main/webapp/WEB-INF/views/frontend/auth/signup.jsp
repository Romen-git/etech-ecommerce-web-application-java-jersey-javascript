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
                            <h2 class="text-center">Create Your Account</h2>
                            <form class="text-left clearfix register-form">
                                <div class="user-full-name">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="First Name"
                                               id="firstname_1">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Last Name" id="lastname_1">
                                    </div>
                                </div>
                                <div class="user-name">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Username" id="username_1">
                                    </div>
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" id="email_1">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Password" id="password_1">
                                </div>
                                <div class="text-center mt-50">
                                    <button type="submit" class="btn btn-main text-center signup1">Sign Up</button>
                                </div>
                            </form>
                            <p class="mt-40 to-login">Already hava an account ?<a href="${BASE_URL}login"> Login</a></p>
                            <p class="forgot-password"><a href="forget-password.html"> Forgot your password?</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </layout:put>
    <layout:put block="script2">
        <script type="text/javascript">
            document.querySelector('.signup1').addEventListener('click', function () {
                let firstname = document.getElementById('firstname_1').value;
                let lastname = document.getElementById('lastname_1').value;
                let username = document.getElementById('username_1').value;
                let email = document.getElementById('email_1').value;
                let password = document.getElementById('password_1').value;


                fetch('${BASE_URL}signup', {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        firstname: firstname,
                        lastname: lastname,
                        username: username,
                        email: email,
                        password: password,

                    })
                }).then(async response => {

                    if (response.ok) {
                        window.location.href = "${BASE_URL}login"
                    } else {
                        //throw new Error();
                        return await response.text();
                    }
                    return await response.text();
                }).then(text => alert(text))
                    .catch(error => {

                    })

            });
        </script>
    </layout:put>
</layout:extends>