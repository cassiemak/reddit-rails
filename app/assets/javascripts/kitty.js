// var app = angular.module('app_name', arr_of_module_name)
// arr_of_module_name = ['ngRoute', 'ng-polymer-elements']

// successfully initalize angular with no extra modules. 
var app = angular.module('kitty', []);

// app.controller('name_of_controller', function('refer to the modules if you have any'){
// })

// Naming convertion for controller -> "NameCtrl"
app.controller('PostCtrl', function($scope){
  // this is NOT jquery
  $scope.brand = "coca-cola";
  $scope.prices = [1,4,5,6,7,65];

  $scope.addPrice = function(){
    $scope.prices.push($scope.newPrice);
    $scope.newPrice = "";
  }
});