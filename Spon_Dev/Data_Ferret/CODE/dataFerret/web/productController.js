var app = angular.module('dataFerret', []);
app.controller('productController', function($scope, $element) {
    
    var exchange = 14;
    var productJson = $element[0].attributes["product-list"].value;
    while (productJson.includes("$")) {
        productJson = productJson.replace("$", "\"");
    };
   
    $scope.products = JSON.parse(productJson);
    
    sessionStorage.searchType = "searchType";
    sessionStorage.searchPhrase = "searchPhrase";
    sessionStorage.numberOfTweets = "numberOfTweets";
        
    
    $scope.selectedProduct = $scope.products[0];

    if(sessionStorage.searchType && sessionStorage.searchPhrase && sessionStorage.numberOfTweets) {
        
    }
    
    $scope.getRandValue = function(price){
        return price * exchange;
    }
    
    $scope.selectProduct = function(productId) {
        var selectedProduct = $scope.products.find(function(element) {
           return productId ===  element.id;
        });
        $scope.selectedProduct = selectedProduct;
        console.log($scope.selectedProduct);
        console.log(document.cookie);
    };
    
    $scope.pay = function() {
        $scope.loading = true;
        var searchPhrase = $scope.searchPhrase;
        var amount = $scope.selectedProduct.price;
        var itemName = $scope.selectedProduct.name;
        var searchType = $scope.searchType;
        var numberOfTweets = $scope.selectedProduct.noOfTweets;
        
        sessionStorage.searchType = searchType;
        sessionStorage.searchPhrase = searchPhrase;
        sessionStorage.numberOfTweets = numberOfTweets;
        
        console.log(searchPhrase + ' ' + searchType + ' ' + amount + ' ' + itemName);
        //TODO call service here
    }
});