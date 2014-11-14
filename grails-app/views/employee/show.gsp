<html>
	<head>
		<meta name="layout" content="main">
		<title>TimeLog - ${ employee?.fullName() }</title>
	</head>
	<body>
		<g:render template="nav"></g:render>
		<div class="container-fluid">
			<content>
				<div class="circle-crop-200">
					<g:img url="${ employee?.photo_url }"/>
				</div>
				<h2>${ employee?.fullName() }</h2>
				<h3>${ employee?.position }</h3>
			</content>
		</div>
	</body>
</html>