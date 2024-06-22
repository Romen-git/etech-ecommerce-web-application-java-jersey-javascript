<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 10/4/2023
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form>
    <div>
        <label>Name:</label>
        <input type="text" id="name" name="name" value="" required/>
    </div>
    <br/>
    <div>
        <label>Email:</label>
        <input type="text" id="email" name="email" value="" required/>
    </div>
    <br/>
    <div>
        <button type="button" onclick="updateEmployee();">Submit</button>
    </div>

</form>

<script type="text/javascript">
    function updateEmployee() {
        let name = document.getElementById("name").value;
        let email = document.getElementById("email").value;

        let form = {
            name: name,
            email: email,
        }
        fetch('${BASE_URL}update?id=', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(response => response.text())
            .then(text => {
                if (text === 'success') {
                    alert("update success");
                    window.location.href = "${BASE_URL}employee";
                } else {
                    alert("error");
                }
            })

    }
</script>

</body>
</html>
