<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>
	<h2>Category List</h2>

	<table>
		<thead>
			<tr>
				<g:sortableColumn property="id" title="Id" />
				<g:sortableColumn property="name" title="Name" />
				<g:sortableColumn property="description" title="Description" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${categoryList}" var="category">
				<tr>
					<td>
						${category.id}
					</td>
					<td><g:link action="show" id="${category.id}">
							${category.name}
						</g:link></td>
					<td>
						${category.description}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>


</body>

</html>