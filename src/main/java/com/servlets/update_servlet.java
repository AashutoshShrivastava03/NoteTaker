package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update_servlet")
public class update_servlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// title content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note = s.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
