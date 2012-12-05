<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>
	<h2>Product List</h2>

	<table>
		<thead>
			<tr>
				<g:sortableColumn property="id" title="Id" />
				<g:sortableColumn property="name" title="Name" />
				<g:sortableColumn property="description" title="Description" />
				<g:sortableColumn property="category" title="Category" />
				<g:sortableColumn property="price" title="Price" />
				<g:sortableColumn property="stock" title="Stock" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${productList}" var="product">
				<tr>
					<td>
						${product.id}
					</td>
					<td><g:link action="show" id="${product.id}">
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
					<td>
						${product.stock}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>


</body>

</html>