<html>
	<head>
		<meta name="layout" content="main"/>
		<title>TimeLog Kiosk</title>
		
		<asset:javascript src="app.js"/>
		<asset:javascript src="controllers.js"/>
		<asset:javascript src="directives.js"/>
	</head>
	<body>
		<g:render template="/nav"></g:render>
		<div class="container-fluid">
			<content ng-app="kiosk">
				<div ng-controller="Employees as employees">
					<div class="btn btn-default btn-stub col-md-3 animate-repeat" ng-repeat="employee in list" ng-click="employees.showModal('#employee-pin', $index)">
						<div class="circle-crop-200">
							<img ng-src="{{ '/timelog/' + employee.photo_url }}" height=200/>
						</div>
						<h3>{{ employee.firstName }} {{ employee.lastName }}</h3>
						<h4>{{ employee.position }}</h4>
					</div>
					
					<div class="modal fade employee-modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body clearfix">
									<div class="circle-crop-200 pull-left">
										<img ng-src="{{ '/timelog/' + focus.photo_url }}" height=200/>
									</div>
									<div class="pull-left modal-details row">
										<h1>{{ focus.firstName }} {{ focus.lastName }}</h1>
										<h3>{{ focus.position }}</h3>
										<h2 >
											<small class="primary" ng-if="focus.isLoggedIn">Logged In</small>
											<small ng-if="!focus.isLoggedIn">Logged Out</small><br>
											<small ng-class="{'primary':focus.isLoggedIn}">{{ focus.lastLog | date:'dd-MMM-yyyy (EEE) hh:mm a' }}</small>
										</h2>
									</div>
									<div class="bottom-content row">
										<input type="password" id="employee-pin" value="{{ pin }}" class="form-control pin" placeholder="Use the numpad to enter your PIN"/>
										<numpad></numpad>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</content>
		</div>
	</body>
</html>