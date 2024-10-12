<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
		<spring:url value="/src/bootstrap/dist" var="bts"/>
		<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Add a student</title>
</head>
<body>
	    <div class="container">
        <h2 class="mt-4">Add a Student</h2>
        
        <form:form method="POST" action="addEtudiant" modelAttribute="etd">
            <div class="form-group">
                <label for="nom">Name</label>
                <input type="text" class="form-control" id="nom" name="nom" placeholder="Enter Name" required>
            </div>
            <div class="form-group">
                <label for="prenom">Surname</label>
                <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Enter Surname" required>
            </div>
            <button type="submit" class="btn btn-success">Save</button>
        </form:form>
    </div>
</body>
</html>