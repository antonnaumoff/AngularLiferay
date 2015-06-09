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
                                    <td>Description</td>
                                    <%--<td>Second Name</td>--%>
                                    <%--<td>Salary</td>--%>
                                    <%--<td>Date</td>--%>
                                    <td class="my-table-cell3">

                                        <button ng-click="createRole(role.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-plus"></span>
                                        </button>

                                    </td>
                                    <td class="my-table-cell3">


                                        <button ng-click="usersList()" class="btn btn-default btn-lg">
                                            <span class="icon icon-list"></span>
                                        </button>


                                    </td>
                                </tr>
                                </thead>
                                <tbody>

                                <tr class="my-table-cell" ng-repeat="role in roles">
                                    <td>
                                        {{role.title}}
                                    </td>

                                    <td>{{role.description}}</td>



                                    <%--<td>--%>
                                    <%--{{role.id}}--%>
                                    <%--</td>--%>

                                    <%--<td>--%>
                                    <%--{{roles.second_name}}--%>
                                    <%--</td>--%>

                                    <%--<td>--%>
                                    <%--{{roles.salary}}--%>
                                    <%--</td>--%>

                                    <%--<td>--%>
                                    <%--{{roles.date}}--%>
                                    <%--</td>--%>

                                    <td class="my-table-cell3">

                                        <button ng-click="deleting(role.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-remove"></span>
                                        </button>

                                    </td>

                                    <td class="my-table-cell3">

                                        <button ng-click="editing(role.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-pencil"></span>
                                        </button>

                                    </td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </script>

    <script type="text/ng-template" id="pagination.html">
        <div class="container" ng-controller="paginationCtrl">
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
                                <td>ScreenName</td>
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

                            <tr class="my-table-cell"
                                ng-repeat="item in items | startFrom: startingItem() | limitTo: itemsPerPage">
                                <td>{{item.fullName}}</td>
                                <td>{{item.screenName}}</td>

                                <td class="my-table-cell3">
                                    <div <%--ng-show="permission.delete=='true'"--%>>
                                        <button ng-click="deleting(item.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-remove"></span>
                                        </button>
                                    </div>
                                </td>
                                <td class="my-table-cell3">
                                    <div <%--ng-show="permission.edit=='true'"--%>>
                                        <button ng-click="editing(item.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-pencil"></span>
                                        </button>
                                    </div>

                                </td>

                                <td class="my-table-cell3">
                                    <div>
                                        <button ng-click="rolesList(item.id)" class="btn btn-default btn-lg">
                                            <span class="icon icon-th-list"></span>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            </tbody>

                        </table>
                        <div id="pagination" class="row">
                            <button class="pull-left btn btn-primary btn-sm" ng-disabled="firstPage()"
                                    ng-click="pageBack()">Back
                            </button>
                            <span class="text-center">{{currentPage+1}} page from {{numberOfPages()}}</span>
                            <button class="pull-right  btn btn-primary btn-sm" ng-disabled="lastPage()"
                                    ng-click="pageForward()">
                                Forward
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<ul class="list-group">--%>
        <%--<li class="list-group-item"--%>
        <%--ng-repeat="item in items | startFrom: startingItem() | limitTo: itemsPerPage">{{ item.fullName }}--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--<div id="pagination" class="row">--%>
        <%--<button class="pull-left btn btn-primary btn-sm" ng-disabled="firstPage()" ng-click="pageBack()">Back--%>
        <%--</button>--%>
        <%--<span>{{currentPage+1}} из {{numberOfPages()}}</span>--%>
        <%--<button class="pull-right  btn btn-primary btn-sm" ng-disabled="lastPage()" ng-click="pageForward()">--%>
        <%--Forward--%>
        <%--</button>--%>
        <%--</div>--%>
        </div>
    </script>
    <portlet:actionURL var="actionURL">
        <portlet:param name="param_name" value="param_value"/>
    </portlet:actionURL>

    <portlet:renderURL var="renderURL">
        <portlet:param name="param_name" value="param_value"/>
    </portlet:renderURL>

    <portlet:resourceURL id="resourseURL" var="resourseURL">
        <portlet:param name="id" value="id_value"/>
        <portlet:param name="param2" value="param_value2"/>
    </portlet:resourceURL>

    <script>
        myApp.constant('cfg', {url: '${ajaxURL}', resourseURL: '${resourseURL}'});//TODO RenderUrl with Vetals Lib!!!
        angular.bootstrap(document.getElementById("p_p_id<portlet:namespace />"), ['myApp']);
    </script>
</body>
</html>
