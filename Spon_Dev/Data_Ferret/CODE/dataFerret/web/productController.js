var app = angular.module('dataFerret', []);
app.controller('productController', function($scope, $rootScope) {
    $scope.loading = false;
    
    $scope.products = [
        {id: 0, name: 'Donate', price: 0.99, noOfTweets: 1500},
        {id: 1, name: 'Starter', price: 1.99, noOfTweets: 500},
        {id: 2, name: 'Beginner', price: 2.99, noOfTweets: 1500},
        {id: 3, name: 'Basic', price: 3.99, noOfTweets: 3000},
        {id: 4, name: 'Intermediate', price: 4.99, noOfTweets: 6000},
        {id: 5, name: 'Expert', price: 6.99, noOfTweets: 12000},
        {id: 6, name: 'Premium', price: 8.99, noOfTweets: 18000}
    ];
    
    $scope.selectedProduct = $scope.products[0];
//    $scope.selectedId = 0;
    
    $scope.selectProduct = function(productId) {
        var selectedProduct = $scope.products.find(function(element) {
           return productId ===  element.id;
        });
        $scope.selectedProduct = selectedProduct;
        console.log($scope.selectedProduct);
    };
    $scope.getButtonTextForProductId = function(productId) {
      return productId === 0 ? 'DONATE' : 'COMING SOON';  
    };
    
    $scope.pay = function() {
        $scope.loading = true;
        var searchPhrase = $scope.searchPhrase;
        var amount = $scope.selectedProduct.price;
        var itemName = $scope.selectedProduct.name;
        
        console.log(searchPhrase + ' ' + amount + ' ' + itemName);
        //TODO call service here
    }
});