package com.codingdojo.authentication.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.authentication.models.Book;
import com.codingdojo.authentication.models.LoginUser;
import com.codingdojo.authentication.models.User;
import com.codingdojo.authentication.services.BookService;
import com.codingdojo.authentication.services.UserService;

@Controller
public class HomeController {
	
	
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@GetMapping("/books")
	public String success(
			@ModelAttribute("book") Book book, HttpSession session, Model model) {	
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		List<Book> b = bookService.allBooks();
		
		model.addAttribute("users", userService.find(userId));
		model.addAttribute("books", b);

		return "success.jsp";
	}
	

	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {	
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		User user = userService.register(newUser, result);
		if (user == null) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/books";
	}
	
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}

		if (user == null) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/books";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}
	
	
	
	// ------------------------------------------------------------------------------From here will be focusing on creating Book routes -----------------------------------------------------
	
	@GetMapping("/books/new")
	public String bookCreatePage(
			@ModelAttribute("newBook") Book newBook, Model model, HttpSession session) {	
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userId);
		return "addBook.jsp";
	}
	
	@PostMapping("/books/new")
	public String addBook(
			@Valid @ModelAttribute("newBook") Book newBook, BindingResult result) {
		if (result.hasErrors()) {
			return "addBook.jsp";
		} 
		bookService.createBook(newBook);
		return "redirect:/books";
	}
	
	
	@GetMapping("/books/{id}") 
	public String showBook(
			@PathVariable("id") Long id, Model model, HttpSession session ) {
		Book b = bookService.findBook(id);
		model.addAttribute("books", b);
		model.addAttribute("users", userService.find((Long)session.getAttribute("userId")));
		return "displayBook.jsp";
	}
	
	
	@GetMapping("/books/{id}/edit")
	public String editBookPage(
			@PathVariable("id") Long id, Model model) {
		Book b = bookService.findBook(id);
		model.addAttribute("books", b);
		return "editBook.jsp";
	}
	
	@PutMapping("/books/{id}") 
	public String updateBook(
			@Valid @ModelAttribute("books") Book editBook, BindingResult result) {
		if (result.hasErrors()) {
			return "editBook.jsp";
		}
		bookService.editBook(editBook);
		return "redirect:/books";
	}
	
	@DeleteMapping("/books/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}
}
