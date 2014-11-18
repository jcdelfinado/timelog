<html>
	<head>
		<title>TimeLog Kiosk</title>
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
  		<asset:stylesheet src="base.css"/>
		<asset:javascript src="application.js"/>
		<asset:javascript src="app.js"/>
		<asset:javascript src="controllers.js"/>
		<asset:javascript src="directives.js"/>
	</head>
	<body>
		<div ng-app="kiosk">
			<header class="well well-lg">
				<h1><small>Time Logger Exercise</small></h1>
				<time-display></time-display>
			</header>
			<g:render template="/nav"></g:render>
			<div class="container-fluid">
				<content>
					<div ng-controller="Employees as employees">
						<div class="btn btn-default btn-stub col-md-3 animate-repeat" ng-repeat="employee in list" ng-click="employees.showModal('#employee-pin', $index)">
							<div class="circle-crop-200">
								<img ng-src="{{ '/timelog/' + employee.photo_url }}" height=200/>
							</div>
							<h3>{{ employee.firstName }} {{ employee.lastName }}</h3>
							<h4>{{ employee.position }}</h4>
						</div>
						<employee-modal></employee-modal>
					</div>
					
				</content>
			</div>
		</div>
	</body>
</html>