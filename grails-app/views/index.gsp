<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>

	<h2>Product List</h2>

	<table>
		<tbody>
			<g:each in="${productList}" var="product">
				<tr>
					<td>
						${product.id}
					</td>
					<td><g:link action="show" id="${product.id}">
							${product.name}
						</g:link></td>
					<td>
						${product.description}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<h2>Available Controllers:</h2>
	<ul>
		<g:each var="c"
			in="${grailsApplication.controllerClasses.sort { it.fullName } }">
			<li class="controller"><g:link
					controller="${c.logicalPropertyName}">
					${c.fullName}
				</g:link></li>
		</g:each>
	</ul>
	


</body>
</html>
