<%@ page import="com.ro.etech.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.ro.etech.entity.Employee" %>
<%@ page import="com.ro.etech.service.EmployeeService" %><%--
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
    <%
        String id = request.getParameter("id");
        EmployeeService employeeService = new EmployeeService();
        Employee employee = employeeService.employeeById(id);

    %>
    <div>
        <label>Name:</label>
        <input type="text" id="name" name="name" value="<%=employee.getName()%>" required/>
    </div>
    <br/>
    <div>
        <label>Email:</label>
        <input type="text" id="email" name="email" value="<%=employee.getEmail()%>" required/>
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
        fetch('${BASE_URL}update?id=<%=employee.getId()%>', {
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
