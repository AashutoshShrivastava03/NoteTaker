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

@WebServlet("/save")
public class save_servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try 
		{
			// title content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note=new Note(title, content, new Date());
			System.out.println(note.getId()+" : "+note.getTitle()+" : "+note.getContent());
			// hibernate:save()
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			out.println("<h1 style='text-align:center; color: #F15461;'>Note is added successfully</h1>");
			out.println("<form action='all_notes.jsp'>");
			out.println("<div style='text-align:center;'>");
			out.println("<button class='btn btn-outline-primary' type='submit'>View All Notes</button>");
			out.println("</div>");
			out.println("</form>");
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
}