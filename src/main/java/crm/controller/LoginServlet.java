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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		PersonDao personDao = new PersonDao();
		List<Person> li = personDao.getAllPerson();
		String personPassword = null;
		String personWhoLoggedIn = null;
		
		boolean value =false;
		for(Person per: li) {
			if(username.equals(per.getUsername())) {
				value = true;
				personPassword = per.getPassword();
				personWhoLoggedIn = per.getFirstname();
				break;
			}
		}
		if(value) {
			if(password.equals(personPassword)) {
				Cookie cookie = new Cookie("name", personWhoLoggedIn);
				resp.addCookie(cookie);

				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("name", personWhoLoggedIn);
				
				List<Person> list = personDao.getAllPerson();
				req.setAttribute("list", list);;
				RequestDispatcher dispatcher =  req.getRequestDispatcher("display.jsp");
				dispatcher.forward(req, resp);
				
			}else {
				req.setAttribute("message","Sorry Password is not correct");
				RequestDispatcher dispatcher =  req.getRequestDispatcher("login.jsp");
				dispatcher.include(req, resp);
			}
		}
		else {
			req.setAttribute("message","Sorry Username is not correct");
			RequestDispatcher dispatcher =  req.getRequestDispatcher("login.jsp");
			dispatcher.include(req, resp);
		}
	}

}