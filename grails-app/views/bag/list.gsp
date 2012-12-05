<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>
	<h2>My Shopping  Bag</h2>

	<table>
		<thead>
			<tr>
				<g:sortableColumn property="id" title="Id" />
				<g:sortableColumn property="dateCreated" title="Date Created" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${bagList}" var="bag">
				<tr>
					<td><g:link action="show" id="${bag.id}">
							${bag.id}
						</g:link></td>
					<td>
						${bag.dateCreated}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>

</body>

</html>