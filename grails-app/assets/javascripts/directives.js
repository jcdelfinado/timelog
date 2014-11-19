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

//fullscreen control
app.directive('fullscreenButton', function(){
	console.log('fullscreen');
	return {
		restrict: 'E',
		templateUrl: '/timelog/assets/_fullscreen.html',
		controller: ['$scope', function($scope){
			console.log('defining control..')
			angular.forEach(["fullscreenchange", "mozfullscreenchange", "webkitfullscreenchange", "msfullscreenchange"], function(value){
				console.log('adding listener for ' + value);
				$(document).on(value, function(event){
					console.log('event fired := ' + event.name);
					$scope.fullscreen = (document.fullscreen || document.mozFullScreen || document.webkitIsFullScreen || document.msFullscreenElement)?true:false;
				});
			});
			
			this.toggleFullscreen = function(){				
				$scope.fullscreen = (document.fullscreen || document.mozFullScreen || document.webkitIsFullScreen || document.msFullscreenElement)?true:false;
				console.log('fullscreen := ' + $scope.fullscreen);
				var doc;
				if (!$scope.fullscreen){
					console.log('Going fullscreen...');
					doc = document.documentElement;
					var request = doc.requestFullscreen || doc.mozRequestFullScreen || doc.webkitRequestFullScreen || doc.msRequestFullscreen;
				}else{
					console.log('Exiting fullscreen...');
					doc = document;
					var request = doc.exitFullscreen || doc.cancelFullScreen || doc.mozCancelFullScreen || doc.webkitCancelFullscreen || doc.webkitCancelFullScreen;
				} 
					
				if (typeof request != 'undefined' && request) request.call(doc);
				else console.log('Bad fullscreen request')
				
			}
		}],
		controllerAs: 'fullscreenCtrl',
		link: function(scope, element, attrs){
			
		}
	};
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
		controller: ['$http', '$scope', '$interval', function($http, $scope, $interval){
			$('.modal').on('hidden.bs.modal', function(event){
				$scope.pin = '';
				$scope.adminPin = '';
				$interval.cancel($scope.intervalId);
			});
			$scope.pressSubmit = function(){
				var id = $scope.focus.id;
				console.log('Logging employee ' + id)
				if ($scope.target == '#employee-pin'){
					var data = {pin : $scope.pin, id: $scope.focus.id};
					//console.log("We're passing this " + data.pin)
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