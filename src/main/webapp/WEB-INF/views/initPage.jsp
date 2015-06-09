<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet" %>
<portlet:defineObjects/>

<html>
<head>
    <title>Welcome!</title>
</head>

<body>
<ng-view></ng-view>
<div class="container" ng-controller="MainController">

    <script type="text/ng-template" id="usersList.html">
        <div class="container" ng-controller="UsersListController">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="custom">Users List</div>
                        </div>

                        <table class="table-striped">
                            <thead>
                            <tr class="table-header">
                                <td>Title</td>
                                <td class="my-table-cell3"></td>
                                <td class="my-table-cell3"></td>
                                <td class="my-table-cell3">
                                    <%--<div ng-show="permission.edit=='true'">--%>
                                        <%--<button ng-click="createDepartment()" class="btn btn-default btn-lg">--%>
                                            <%--<span class="icon icon-plus"></span>--%>
                                        <%--</button>--%>
                                    <%--</div>--%>
                                </td>
                            </tr>
                            </thead>

                            <tbody>

                            <tr class="my-table-cell" ng-repeat="user in users">
                                <td>{{user.fullName}}</td>

                                <td class="my-table-cell3">
                                    <div <%--ng-show="permission.delete=='true'"--%>>
                                        <button ng-click="deleting(dep.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-remove"></span>
                                        </button>
                                    </div>
                                </td>
                                <td class="my-table-cell3">
                                    <div <%--ng-show="permission.edit=='true'"--%>>
                                        <button ng-click="editing(dep.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-pencil"></span>
                                        </button>
                                    </div>

                                </td>

                                <td class="my-table-cell3">
                                    <div>
                                        <button ng-click="rolesList(user.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-th-list"></span>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-2">
                    <button ng-click="rolesList()" class="btn btn-default btn-lg">
                        <span class="icon icon-list"></span>
                    </button>
                </div>
            </div>
        </div>
    </script>
    <script type="text/ng-template" id="rolesList.html">
        <div class="view">
            <div class="container" ng-controller="RolesListController">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="custom">Roles List</div>
                            </div>

                            <table class="table-striped">
                                <thead>
                                <tr class="table-header">
                                    <td>Title</td>
                                    <td>First Name</td>
                                    <td>Second Name</td>
                                    <td>Salary</td>
                                    <td>Date</td>
                                    <td class="my-table-cell3">
                                        <%--<form ng-show="permission.edit=='true'">--%>
                                            <%--<button ng-click="createEmployee(dep_id)" class="btn btn-default btn-lg">--%>
                                                <%--<span class="glyphicon glyphicon-plus"></span>--%>
                                            <%--</button>--%>
                                        <%--</form>--%>
                                    </td>
                                    <td class="my-table-cell3">
                                        <%--</form>--%>
                                        <%--<form>--%>
                                            <%--<button ng-click="departmentList()" class="btn btn-default btn-lg">--%>
                                                <%--<span class="glyphicon glyphicon-th-list"></span>--%>
                                            <%--</button>--%>
                                        <%--</form>--%>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>

                                <tr class="my-table-cell" ng-repeat="role in roles">
                                    <td>
                                        {{roles.title}}
                                    </td>

                                    <td>
                                        {{roles.id}}
                                    </td>

                                    <td>
                                        {{roles.second_name}}
                                    </td>

                                    <td>
                                        {{roles.salary}}
                                    </td>

                                    <td>
                                        {{roles.date}}
                                    </td>

                                    <td class="my-table-cell3">
                                        <form ng-show="permission.delete=='true'">
                                            <button ng-click="deleting(emp.id, dep_id)" class="btn btn-default btn-lg">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                        </form>
                                    </td>

                                    <td class="my-table-cell3">
                                        <form ng-show="permission.edit=='true'">
                                            <button ng-click="editing(emp.id)" class="btn btn-default btn-lg">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </form>
                                    </td>

                                </tr>

                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="col-sm-2">
                            <button ng-click="usersList()" class="btn btn-default btn-lg">
                                <span class="icon icon-list"></span>
                            </button>
                    </div>
                </div>
            </div>
        </div>
    </script>
</div>
<script>
    myApp.constant('cfg', {url: '${ajaxURL}'});//TODO RenderUrl with Vetals Lib!!!
    myApp.constant('pId', {url: '${portletId}'});
    angular.bootstrap(document.getElementById("p_p_id<portlet:namespace />"), ['myApp']);
</script>
</body>
</html>
