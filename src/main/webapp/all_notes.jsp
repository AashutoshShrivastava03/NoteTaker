<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<!-- Search Form -->
		<form class="d-flex" method="GET">
			<input class="form-control me-2" type="text" name="query"
				placeholder="Search Notes"
				value="<%=request.getParameter("query") != null ? request.getParameter("query") : ""%>">
			<button class="btn btn-outline-light" type="submit">Search</button>
		</form>

		<br>
		<h1 class="text-uppercase">All Notes:</h1>

		<div class="row">
			<div class="col-12">

				<%
				// Open Hibernate session
				Session s = FactoryProvider.getFactory().openSession();

				// Get the search query from the URL parameter
				String searchQuery = request.getParameter("query");
				Query q;

				if (searchQuery != null && !searchQuery.trim().isEmpty()) {
				    // If search query exists, filter the notes
				    q = s.createQuery("FROM Note WHERE title LIKE :search OR content LIKE :search");
				    q.setParameter("search", "%" + searchQuery + "%");
				} else {
				    // If no search query, get all notes
				    q = s.createQuery("FROM Note");
				}

				// Fetch the list of notes
				java.util.List<com.entities.Note> list = q.list();

				// Check if any notes are found
				if (list.isEmpty()) {
				    out.println("<h5 class='text-danger'>No notes found!</h5>");
				}

				// Loop through the notes
				for (com.entities.Note note : list) {
				%>
				<div class="card mt-3">
					<img src="image/notepad.png" style="max-width: 100px"
						class="card-img-top m-3" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p>
							<b class="text-primary">
								<%=new java.text.SimpleDateFormat("dd-MM-yyyy").format(note.getAddedDate())%>
							</b>
						</p>

						<a href="delete_servlet?note_id=<%=note.getId()%>"
							class="btn btn-danger">Delete</a> 
						<a href="edit.jsp?note_id=<%=note.getId()%>"
							class="btn btn-primary">Update</a>
					</div>
				</div>

				<%
				}

				// Close session
				s.close();
				%>

			</div>
		</div>

	</div>
</body>
</html>
