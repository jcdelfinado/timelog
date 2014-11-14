var app = angular.module('Kiosk', [])

function EmployeeStub($http){
	alert('OK we got this');
	var employee = this;
	var get = function(id){
		$.employee.list
	}
	$.get('/timelog/kiosk/employees').success(function(data){
		console.log("We actually got some data! hahaha")
		employee.list = data['employees'];
		console.log(JSON.stringify(data));
		console.log(employee.list[0].firstName)
	})
}

app.controller('EmployeeStub',  ['$http', function($http){EmployeeStub($http);}]);