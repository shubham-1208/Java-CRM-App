package crm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crm.dao.PersonDao;
import crm.dto.Person;

@WebServlet("/gobac")
public class GoBackServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersonDao personDao = new PersonDao();
		List<Person> li = personDao.getAllPerson();
		int id=Integer.parseInt(req.getParameter("id"));
		Person person = personDao.getPersonById(id);
		String personWhoLoggedIn = person.getFirstname();
		Cookie cookie = new Cookie("name", personWhoLoggedIn);
		resp.addCookie(cookie);

		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("name", personWhoLoggedIn);
		
		List<Person> list = personDao.getAllPerson();
		req.setAttribute("list", list);;
		RequestDispatcher dispatcher =  req.getRequestDispatcher("display.jsp");
		dispatcher.forward(req, resp);
	}
}
