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
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-left" ng-show="!fullscreen">
						<ul class="nav navbar-nav">
							<li>
								<g:link controller="kiosk">Kiosk</g:link>
							</li>
							<li><g:link controller="employee">Employees</g:link></li>
							<li><g:link controller="log">Logs</g:link></li>
						</ul>
					</div>
					<div class="navbar-brand" ng-show="fullscreen">
						Tap your name or photo to log in or log out.						
					</div>
					<div class="navbar-right">
						<ul class="nav navbar-nav">
							<li><a href="#"><fullscreen-button></fullscreen-button></a></li>
						</ul>
					</div>
				</div>
				<admin-modal></admin-modal>
			</nav>
			<div class="container-fluid">
				<content>
					<div ng-controller="Employees as employees">
						<div class="col-md-3 animate-repeat" ng-repeat="employee in list">
						<div class="btn-stub col-md-12 hand-pointed" ng-click="employees.showModal('#employee-pin', $index)">
							<div class="circle-crop-200" ng-class="{'logged-in':employee.isLoggedIn}">
								<img ng-src="{{ '/timelog/' + employee.photo_url }}" height=200/>
							</div>
							<h3>{{ employee.firstName }} {{ employee.lastName }}</h3>
							<h4>{{ employee.position }}</h4>
						</div>
						</div>
						<employee-modal></employee-modal>
					</div>
				</content>
			</div>
		</div>
	</body>
</html>