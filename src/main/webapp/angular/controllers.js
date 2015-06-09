var myApp = angular.module('myApp', ['ngRoute']);

myApp.filter('startFrom', function(){
    return function(input, start){
        start = +start;
        return input.slice(start);
    }
});

myApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/usersList', {
            templateUrl: "usersList.html",
            controller: 'UsersListController'
        })
        .when('/rolesList', {
            templateUrl: "rolesList.html",
            controller: 'RolesListController'
        }).when('/pagination', {
            templateUrl: "pagination.html",
            controller: "paginationCtrl"
        })
}]);

myApp.controller("MainController", ['$scope', '$http', '$location', function ($scope, $http, $location) {

    $location.path("/pagination");


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
        $location.path("/pagination");
    };
}]);

myApp.controller('paginationCtrl', [ '$scope', '$http', '$location', 'cfg', '$rootScope', function($scope, $http, $location, cfg, $rootScope){
    $scope.currentPage = 0;
    $scope.itemsPerPage = 10;
    $scope.items = [];

    $http.post(cfg.url + "&p_p_resource_id=getAllUsersAndRoles")
        .success(function (data) {
            if (data[0] === 'DataBaseException') {
                //TODO redirect to error page
            } else {
                $scope.items = data;
            }
        }).error(function () {
            alert("server is under reconstruction, try later");
        });
    $scope.firstPage = function() {
        return $scope.currentPage == 0;
    };
    $scope.lastPage = function() {
        var lastPageNum = Math.ceil($scope.items.length / $scope.itemsPerPage - 1);
        return $scope.currentPage == lastPageNum;
    };
    $scope.numberOfPages = function(){
        return Math.ceil($scope.items.length / $scope.itemsPerPage);
    };
    $scope.startingItem = function() {
        return $scope.currentPage * $scope.itemsPerPage;
    };
    $scope.pageBack = function() {
        $scope.currentPage = $scope.currentPage - 1;
    };
    $scope.pageForward = function() {
        $scope.currentPage = $scope.currentPage + 1;
    };


    $scope.rolesList = function (id) {
        $rootScope.id = id;
        $location.path("/rolesList");
    };

    $scope.deleting = function (dep_id) {
        alert("Deleting Department" + dep_id);
    };

    $scope.editing = function (dep_id) {
        $location.path("/pagination");
    };

    $scope.createDepartment = function () {
        alert("Create new Department");
    }
}]);

