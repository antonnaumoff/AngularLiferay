<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet" %>
<portlet:defineObjects/>

<html>
<head>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>--%>
    <%--<script type="application/javascript"--%>
    <%--src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.js"></script>--%>
    <%--<script src="<c:url value= "/angular/controllers.js"/>"></script>--%>
    <%--<script type="application/javascript" src="<c:url value= "/angular/angular-route.js"/>"></script>--%>
    <%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="<c:url value="/css/my.css"/>" type="text/css">--%>
    <title>Welcome!</title>
</head>

<body >
<ng-view></ng-view>
<div class="container" ng-controller="MainController">

    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">

            <div class="login">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="custom">Roles List</div>
                    </div>
                    <div class="container-fluid">

                        <span class="alarma">{{hello}}</span>
                        <span class="alarma">{{users.users}}</span>
                        <span class="alarma">{{users.roles}}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
        </div>

    </div>
</div>
<div>
</div>
<script>
        myApp.constant('cfg', {url: '${ajaxURL}'});//TODO RenderUrl with Vetals Lib!!!
        angular.bootstrap(document.getElementById("p_p_id<portlet:namespace />"), ['myApp']);
</script>

</body>
</html>
