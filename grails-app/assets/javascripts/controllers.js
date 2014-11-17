//var app = angular.module('kiosk.controllers')

function Employees($http, $scope){
	var employee = this;
	this.showModal = function(target, index){
		$scope.target = target;
		console.log('Showing modal for employee in index ' + index);
		$scope.focus = $scope.list[index];
		$scope.focus.index = index;
		console.log('Focus is now on ' + $scope.focus.firstName);
		$('.employee-modal').modal('show');
	}
	$http.get('/timelog/kiosk/employees').success(function(data){
		$scope.list = data;
		console.log(JSON.stringify(data));
		$scope.focus = $scope.list[0];
		console.log($scope.list[0].firstName)
	});
};
app.controller('Employees',  ['$http', '$scope', Employees]);
/*
function showModal (target-pin, index){
	
};*/