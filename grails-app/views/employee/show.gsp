<html>
	<head>
		<meta name="layout" content="main">
		<title>TimeLog - ${ employeeInstance?.fullName() }</title>
	</head>
	<body>
		<g:render template="/nav"></g:render>
		<div class="container-fluid">
			<content style="text-align: center">
				<div class="circle-crop-200">
					<g:img dir="/"file="${ employeeInstance?.photo_url }" height="200px"/>
				</div>
				<h2>${ employeeInstance?.fullName() }</h2>
				<h3>${ employeeInstance?.position }</h3>
				<div class="row">
					<button class="btn btn-default">Edit</button>
					<button class="btn btn-default">Delete</button>
				</div>
				<div class="row large-clearing">
					<g:link class="large-padding" controller="employee" action="create">
						<span class="glyphicon glyphicon-plus"></span> Add New
					</g:link>
				</div>
			</content>
			
		</div>
	</body>
</html>