package crm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crm.dao.PersonDao;
import crm.dto.Person;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		person.setFirstname(firstname);
		person.setLastname(lastname);
		person.setUsername(username);
		person.setPassword(password);
		person.setPhoneno(phoneno);
		person.setPincode(pincode);
		person.setState(state);
		
		PersonDao personDao = new PersonDao(); 
		List<Person> li = personDao.getAllPerson();
		boolean value = true;
		
		for(Person p: li) {
			if(email.equals(p.getEmail()) || username.equals(p.getUsername())) {
				value = false;
				break;
			}
		}
		if(value) {
			personDao.savePerson(person);
			req.setAttribute("message","SignUp successful please login");
			RequestDispatcher dispatcher =  req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		}else {
			req.setAttribute("message","Sorry Email already exist or Username is unavailable please give a different Email or try a different Username");
			RequestDispatcher dispatcher =  req.getRequestDispatcher("signup.jsp");
			dispatcher.include(req, resp);
		}
		
	}
}