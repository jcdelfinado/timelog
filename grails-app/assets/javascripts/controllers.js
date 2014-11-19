var app = angular.module('kiosk');

function Employees($http, $scope, $interval){
	var employee = this;
	this.updateToday = function(){
		$http.get('/timelog/kiosk/today?id='+$scope.focus.id).
		success(function(data){
			console.log('today := '+data);
			$scope.focus.today = data;
		});
	};
	this.showModal = function(target, index){
		$scope.target = target;
		$scope.errors = [];
		console.log('Showing modal for employee in index ' + index);
		$scope.focus = $scope.list[index];
		$scope.focus.index = index;
		console.log('Focus is now on ' + $scope.focus.id + ' = ' + $scope.focus.firstName);
		employee.updateToday();
		$scope.intervalId = $interval(employee.updateToday, 5000);
		$('.employee-modal').modal('show');
	}
	$http.get('/timelog/kiosk/employees').success(function(data){
		$scope.list = data;
		$scope.focus = $scope.list[0];
		console.log('Employee data retrieved.')
	});
};
app.controller('Employees',  ['$http', '$scope', '$interval', Employees]);
