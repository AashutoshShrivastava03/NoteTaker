<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Note Taker : Home page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>


	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<div class="card py-5">
			<img alt="" class="img-fluid mx-auto" style="max-width: 380px;"
				src="image/notes.background.png">
			<h2 class="text-primary text-uppercase text-center mt-3">Start
				Taking Notes</h2>

			<div class="container text-center">
				<a href="add_notes.jsp" class="btn btn-outline-primary start-btn">Start
					Here</a>
			</div>


		</div>


	</div>





</body>
</html>