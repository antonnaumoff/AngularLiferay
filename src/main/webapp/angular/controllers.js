var myApp = angular.module('myApp', ['ngRoute']);

myApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/usersList', {
            templateUrl: "usersList.html",
            controller: 'UsersListController'
        })
        .when('/rolesList', {
            templateUrl: "rolesList.html",
            controller: 'RolesListController'
        }).when('/logout', {
            templateUrl: "usersList.html"
        })
}]);

myApp.controller("MainController", ['$scope', '$http', '$location', function ($scope, $http, $location) {

    $location.path("/usersList");


}]);

myApp.controller("UsersListController", ['$scope', '$http', '$location', '$rootScope', 'cfg', function ($scope, $http, $location, $rootScope, cfg) {

    $scope.users = {};

    $http.post(cfg.url + "&p_p_resource_id=getAllUsersAndRoles")
        .success(function (data) {
            if (data[0] === 'DataBaseException') {
                //TODO redirect to error page
            } else {
                $scope.users = data;
            }
        }).error(function () {
            alert("server is under reconstruction, try later");
        });

    $scope.rolesList = function (id) {
        $rootScope.id = id;
        $location.path("/rolesList");
    };

    $scope.deleting = function (dep_id) {
        alert("Deleting Department" + dep_id);
    };

    $scope.editing = function (dep_id) {
        alert("Editing Department" + dep_id);
    };

    $scope.createDepartment = function () {
        alert("Create new Department");
    }

}]);

myApp.controller("RolesListController", ['$scope', '$http', '$location', '$rootScope', 'cfg', function ($scope, $http, $location, $rootScope, cfg) {

    $scope.roles = {};

    $scope.url = cfg.resourseURL.replace("id_value", $rootScope.id);

    $http.post($scope.url)
        .success(function (data) {
            if (data[0] === 'DataBaseException') {
                //TODO redirect to error page
            } else {
                $scope.roles = data;
            }
        }).error(function () {
            alert("server is under reconstruction, try later");
        });

    $scope.usersList = function () {
        $location.path("/usersList");
    };
}]);