<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>
	<div>
		<h2>
			Products in
			${category.name}
		</h2>
		<h5>
			${category.description}
		</h5>
		<p>
			<strong>Created by:</strong>
			${category.user}
		</p>
		<p>
			<strong>Date Created:</strong>
			${category.dateCreated}
			| <strong>Last Updated:</strong>
			${category.lastUpdated}
		</p>
		<g:if test="${session?.user?.username == 'admin'}">
			<g:form>
				<input type="hidden" name="id" value="${category?.id}" />
				<g:actionSubmit value="Edit" />
				<g:actionSubmit onclick="return confirm('Are you sure?');"
					value="Delete" />
			</g:form>
		</g:if>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="name" title="Name" />
					<g:sortableColumn property="description" title="Description" />
					<g:sortableColumn property="price" title="Price" />
					<g:sortableColumn property="category" title="Category" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${category.products}" var="product">
					<tr>
						<td>
							${product.id}
						</td>
						<td><g:link controller="product" action="show"
								id="${product.id}">
								${product.name}
							</g:link></td>
						<td>
							${product.description}
						</td>
						<td>
							${product.price}
						</td>
						<td>
							${product.category}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>



	<br>

</body>

</html>