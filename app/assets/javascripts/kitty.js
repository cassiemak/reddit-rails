// var app = angular.module('app_name', arr_of_module_name)
// arr_of_module_name = ['ngRoute', 'ng-polymer-elements']

// successfully initalize angular with no extra modules. 
var app = angular.module('kitty', []);

// app.controller('name_of_controller', function('refer to the modules if you have any'){
// })

// Naming convertion for controller -> "NameCtrl"
app.controller('PostCtrl', function($scope){
  $scope.brand = "coca-cola";
  $scope.prices = [1,4,5,6,7,65];
  $scope.sum = addition($scope.prices);


  $scope.addPrice = function(){
    if ($scope.priceForm.$valid && $scope.newPrice != null){
    $scope.prices.push($scope.newPrice);
    $scope.sum = addition($scope.prices);
    } else {
    alert ('form invalid!');
    }
    $scope.newPrice = "";
  }


  function addition(arr){
    // for (var i=0; i < $scope.prices.length(); i++){
    //   $scope.sum += $scope.prices[i];
    // }
    var total = 0;
    arr.forEach(function(item){
      total += item;
    })
    return total;
  }


  $scope.ifNumber = function(){
    $scope.newPrice; 
  }

});


app.controller('CompanyCtrl', function($scope){
  $scope.companies = ["Apple", "Microsoft", "Google", "Alibaba", "Tencent"];
})

