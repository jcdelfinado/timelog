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

//time display
app.directive('timeDisplay', ['$interval', function($interval){
	console.log('time');
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
			$scope.pressSubmit = function(){
				var id = $scope.focus.id;
				console.log('Logging employee ' + id)
				if ($scope.target == '#employee-pin'){
					var data = {pin : $scope.pin, id: $scope.focus.id};
					console.log("We're passing this " + data.pin)
					$http({
						method: 'POST',
						url: '/timelog/kiosk/log/',
						data: data,
						headers: {'Content-Type': 'application/x-www-form-urlencoded'},
						transformRequest: function(obj){
							var str = [];
							for(var p in obj)
								str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
							return str.join("&");
						},
					}).success(function(data){
						$scope.focus.lastLog = data.logTime;
						$scope.focus.isLoggedIn = data.isLogIn;
						$scope.list[$scope.focus.index].lastLog = data.logTime;
						$scope.list[$scope.focus.index].isLoggedIn = data.isLogIn;
						$scope.errors.mismatch = false;	
						$('.modal').modal('hide');
					}).error(function(data, status){
						if (status==403){
							$scope.errors.mismatch = true;
							$scope.pressCancel();
						}
					});
				}
			};
		}],
		link: function ($scope){
			var numpad = this;
			$scope.pin = '';
			$scope.adminPin = '';
			$scope.pressCancel = function(){
				if ($scope.target=='#employee-pin') {
					$scope.pin ='';
					$('#employee-pin').removeClass('ng-dirty');
					$('#employee-pin').addClass('ng-pristine');
				}
				else{
					$scope.adminPin = '';
					$('#admin-pin').removeClass('ng-dirty');
					$('#admin-pin').addClass('ng-pristine');
				}
			}
			$scope.pressNum = function(num){
				if ($scope.target=='#employee-pin') {
					$scope.pin += num;
					console.log("focus.pin : " + $scope.focus.pin);
					$('#employee-pin').removeClass('ng-pristine');
					$('#employee-pin').addClass('ng-dirty');
				}
				else {
					$scope.adminPin += num;
					$('#admin-pin').removeClass('ng-pristine');
					$('#admin-pin').addClass('ng-dirty');					
				}
			};
		}
	}
}]);