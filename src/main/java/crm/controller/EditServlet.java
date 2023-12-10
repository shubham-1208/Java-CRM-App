package crm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crm.dao.PersonDao;
import crm.dto.Person;

@WebServlet("/edit")
public class EditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String state = req.getParameter("state");
		String country = req.getParameter("country");
		String password = req.getParameter("password");
		String username = req.getParameter("username");
		long pincode = Long.parseLong(req.getParameter("pincode"));
		long phoneno = Long.parseLong(req.getParameter("phoneno"));
		
		Person person = new Person();
		person.setAddress(address);
		person.setCountry(country);
		person.setEmail(email);
		person.setId(id);
		person.setFirstname(firstname);
		person.setLastname(lastname);
		person.setUsername(username);
		person.setPassword(password);
		person.setPhoneno(phoneno);
		person.setPincode(pincode);
		person.setState(state);
		
		PersonDao personDao = new PersonDao();
		personDao.updatePerson(person);
		
		Cookie[] cookies = req.getCookies();
		String nameWhoChangedTheDetails = null;
		for(Cookie cookie: cookies) {
			if(cookie.getName().equals("name")) {
				nameWhoChangedTheDetails = cookie.getValue();
			}
		}
		req.setAttribute("name", nameWhoChangedTheDetails);
		
		req.setAttribute("list", personDao.getAllPerson());
		RequestDispatcher dispatcher = req.getRequestDispatcher("display.jsp");
		dispatcher.forward(req, resp);
	}
}
