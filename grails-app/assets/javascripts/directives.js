console.log("We're processing directives");
var app = angular.module("kiosk");
//the employee modal
app.directive('employeeModal', function(){
	console.log('modal')
	return {
		restrict: 'E',
		templateUrl: '/timelog/assets/_employee-modal.html'
	}
});

app.directive('timeDisplay', ['$interval', function($interval){
	console.log('test');
	return {
		restrict: 'E',
		templateUrl: '/timelog/assets/_time.html',
		link: function($scope){
			$interval(function(){
				$scope.now = new Date();
			}, 500)
		}
	};
}]);
//numpad directive
app.directive('numpad', ['$http', function($http){
	console.log('numpad')
	return {
		restrict: 'E',
		templateUrl: '/timelog/assets/_numpad.html',
		controller: ['$http', '$scope', function($http, $scope){
			$('.modal').on('hidden.bs.modal', function(event){
				$scope.pin = '';
				$scope.adminPin = '';
			});
			$scope.pressSubmit = function(id){
				console.log('Logging employee ' + id)
				if ($scope.target == '#employee-pin'){
					$http.post('/timelog/kiosk/log/'+id).
						success(function(data){
							$scope.focus.lastLog = data.logTime;
							$scope.focus.isLoggedIn = data.isLogIn;
							$scope.list[$scope.focus.index].lastLog = data.logTime;
							$scope.list[$scope.focus.index].isLoggedIn = data.isLogIn;
							$('.modal').modal('hide');
						});
				}
			};
		}],
		link: function ($scope){
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