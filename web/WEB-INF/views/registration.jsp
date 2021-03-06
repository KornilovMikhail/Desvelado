<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="inputTag" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration</title>
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/oxygen_font.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/navbar.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/registration_login_main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet " href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <script src="<c:url value = "/scripts/jquery.js"/>"></script>
    <script src="<c:url value="/scripts/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/scripts/registration.js"/>"></script>
</head>
<body>
<c:set var="genders" value="${['Male','Female']}"/>
<c:set var="genders" value="${fn:replace(genders,']','')}"/>
<c:set var="genders" value="${fn:replace(genders,'[','')}"/>
<div id="navbar">
    <jsp:include page="../includes/navbar.jsp"/>
</div>
<main class="regForm background-custom">
    <div class="main-w3layouts wrapper">
        <h1>Registration:</h1>
        <div class="main-agileinfo">
            <div class="agileits-top">
                <form id="form" method="post">
                    <inputTag:inputTextField textLabel="Enter email:" idField="emailField" typeField="text"
                                             nameField="email" placeholderField="Enter your email" classField="text"/>
                    <inputTag:inputTextField textLabel="Enter username:" idField="usernameField" typeField="text"
                                             nameField="username" placeholderField="Enter your username"
                                             classField="text"/>
                    <inputTag:inputTextField textLabel="Enter password:" idField="passField" typeField="password"
                                             nameField="password" placeholderField="Enter your password"
                                             classField="text"/>
                    <inputTag:inputTextField textLabel="Confirm password:" idField="passConfirmField"
                                             typeField="password" nameField="passwordVerify"
                                             placeholderField="Confirm your password" classField="text"/>
                    <inputTag:inputSelect textLabel="Choose country:" idSelect="countryField" nameSelect="country"
                                          itemsSelect="${listCountries}"/>
                    <inputTag:inputSelect textLabel="Choose gender:" idSelect="genderField" nameSelect="gender"
                                          itemsSelect="${genders}"/>
                    <inputTag:inputTextField textLabel="Choose birthdate:" idField="bDayField" typeField="date"
                                             nameField="bDay" classField="custom-select date"/>
                    <inputTag:inputCB idCB="licenceCBField" nameField="licenceCB"
                                      valueField="I Agree To The Terms & Conditions"/>
                    <div id="error"></div>
                    <input type="submit" value="SIGNUP" id="btnSubmit">
                </form>
                <p>Already have an Account? <a href="<c:url value="/login"/>"> Login Now!</a></p>
            </div>
        </div>
    </div>
</main>
<div id="footer">
    <jsp:include page="../includes/footer.jsp"/>
</div>
</body>
</html>
