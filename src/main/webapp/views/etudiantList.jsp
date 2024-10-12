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
    <title>List of Books</title>
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
</head>
<body>
	<sec:authorize access="isAuthenticated()">
	Bienvenue <sec:authentication property="name"/>
	(<a href="<c:url value="/logout" />">Logout</a>)
	</sec:authorize>
	<br><br>
	<sec:authorize access="hasRole('ADMIN')">
		<a href="showAddForm" class="btn btn-primary">Add New Student</a>
    </sec:authorize>
 <br>
    <div class="container">
        <h2 class="mt-4">List of Students</h2>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Surname</th>
                 <sec:authorize access="hasRole('ADMIN')">
                    <th>Actions</th>
                 </sec:authorize>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="etds" items="${etds}">
                    <tr>
                        
                        <td>${etds.nom}</td>
                        <td>${etds.prenom}</td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td>
                            <a href="deleteEtudiant/${etds.id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </sec:authorize>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        

    </div>
</body>
</html>
