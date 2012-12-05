<html>
<head>
<title>Web Store - Homepage</title>
<meta name="layout" content="main" />
</head>
<body>
	<div>
		<h2>Category List</h2>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="name" title="Name" />
					<g:sortableColumn property="description" title="Description" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${categories}" var="category">
					<tr>
						<td><g:link controller="category" action="show"
								id="${category.id}">
								${category.name}
							</g:link>
						</td>
						<td>
							${category.description}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<br></br>
	<div>
		<h2>Product List</h2>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="name" title="Name" />
					<g:sortableColumn property="description" title="Description" />
					<g:sortableColumn property="category" title="Category" />
					<g:sortableColumn property="price" title="Price" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${products}" var="product">
					<tr>
						<td><g:link controller="product" action="show"
								id="${product.id}">
								${product.name}
							</g:link>
						</td>
						<td>
							${product.description}
						</td>
						<td>
							${product.category}
						</td>
						<td>
							${product.price}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<br></br>
</body>
</html>
