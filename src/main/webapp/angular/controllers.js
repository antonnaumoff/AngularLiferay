var myApp = angular.module('myApp', ['ngRoute']);

myApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/departmentList', {
            templateUrl: "/template/departmentList.html",
            controller: 'DepartmentListController'
        })
        .when('/employeeList', {
            templateUrl: "template/employeeList.html",
            controller: 'EmployeeListController'
        }).when('/logout', {
            templateUrl: "/template/loginForm.html"

        })
}]);

myApp.controller("MainController", ['$scope', '$http', '$location', 'cfg', function ($scope, $http, $location, cfg) {

    $scope.hello = 'Welcome!';
    $scope.authenticatedUser = {};
    $scope.portletId = {};
    $scope.portletAppContextPath = {};
    $scope.users = {};
    $scope.roles = {};

    $http.post(cfg.url + "&p_p_resource_id=getAllUsersAndRoles")//TODO RenderUrl with Vetals Lib!!!
        .success(function (data) {
            $scope.users = data;

        }).error(function () {
            alert("no data");
        });

}]);

//myApp.controller("DepartmentListController", ['$scope', '$http', '$location', '$rootScope', function ($scope, $http, $location, $rootScope) {
//
//    $scope.departments = {};
//
//    $http.post("/getDepartmentList")
//        .success(function (data) {
//            if (data[0] === 'DataBaseException') {
//                //TODO redirect to error page
//            } else {
//                $scope.departments = data;
//            }
//        }).error(function () {
//            alert("server is under reconstruction, try later");
//        });
//
//    $scope.employeeList = function (dep_id) {
//        $rootScope.dep_id = dep_id;
//        $location.path("/employeeList");
//    };
//
//    $scope.deleting = function (dep_id) {
//        alert("Deleting Department" + dep_id);
//    };
//
//    $scope.editing = function (dep_id) {
//        alert("Editing Department" + dep_id);
//    };
//
//    $scope.createDepartment = function () {
//        alert("Create new Department");
//    }
//
//}]);
//
//myApp.controller("EmployeeListController", ['$scope', '$http', '$location','$rootScope', function ($scope, $http, $location, $rootScope) {
//
//    $scope.employees = {};
//
//    $http.post("/getEmployeeList/" + $scope.dep_id)
//        .success(function (data) {
//            if (data[0] === "DataBaseException") {
//                //TODO Redirect to error page
//            } else {
//                $scope.employees = data;
//            }
//        })
//        .error(function () {
//            alert("server is under reconstruction, try later");
//        });
//
//    $scope.departmentList = function(){
//        $rootScope.dep_id = 0;
//        $location.path("/departmentList");
//    };
//
//    $scope.createEmployee = function(dep_id){
//        alert("Creating new Employee" + dep_id);
//    };
//
//    $scope.editing = function( id){
//        alert("Editing Employee" + id);
//    };
//
//    $scope.deleting = function(id, dep_id){
//        alert("Deleting Employee " + id+"in Department with id " + dep_id);
//    };
//
//}]);


