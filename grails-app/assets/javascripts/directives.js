//var app = angular.module('kiosk.directives')

app.directive('employeeModal', function(){
	//alert('NUMPAD!')
	return {
		restrict: 'E',
		template: '/timelog/assets/employee-modal.html'
	}
});
//alert('DIRECTIVES!');
app.directive('numpad', ['$http', function($http){
	return {
		restrict: 'E',
		templateUrl: '/timelog/assets/_numpad.html',
		controller: ['$http', '$scope', function($http, $scope){
			$scope.pressSubmit = function(id){
				console.log('Logging employee ' + id)
				if ($scope.target == '#employee-pin'){
					$http.post('/timelog/kiosk/log/'+id).
						success(function(data){
							$scope.focus.lastLog = data.logTime;
							$scope.focus.isLoggedIn = data.isLogIn;
							$scope.list[$scope.focus.index].lastLog = data.logTime;
							$scope.list[$scope.focus.index].isLoggedIn = data.isLogIn;
						});
				}
			};
		}],
		link: function ($scope, $http){
			var numpad = this;
			$scope.pin = '';
			$scope.adminPin = '';
			$scope.pressCancel = function(){
				if ($scope.target=='#employee-pin') $scope.pin ='';
				else $scope.adminPin = '';
			}
			$scope.pressNum = function(num){
				if ($scope.target=='#employee-pin') $scope.pin += num;
				else $scope.adminPin += num;
			};
		}
	}
}]);