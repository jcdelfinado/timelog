<html>
	<head>
		<meta name="layout" content="main"/>
		<title>TimeLog Kiosk</title>
		<asset:javascript src="controllers.js"/>
	</head>
	<body>
		<g:render template="/nav"></g:render>
		<div class="container-fluid">
			<content ng-app="Kiosk">
				<div ng-controller="EmployeeStub as stub"></div>
			</content>
		</div>
	</body>
</html>