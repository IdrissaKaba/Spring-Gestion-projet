<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <title>Access Denied</title>

</head>
<body>

<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
            <!-- Warning alert -->
            <div class="alert alert-warning text-center" role="alert">
                <strong>Warning!</strong> You are trying to access a restricted page.
            </div>

            <!-- Danger alert -->
            <div class="alert alert-danger text-center" role="alert">
                <strong>Error 403 - Access Denied!</strong> <br />
                ${message}
            </div>

            <div class="text-center">
                <a href="/" class="btn btn-primary">Go to Home</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
