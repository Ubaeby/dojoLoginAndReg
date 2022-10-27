package com.codingdojo.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.authentication.models.Book;
import com.codingdojo.authentication.repositories.BookRepository;


@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepo;

	public List<Book> allBooks() {
		return bookRepo.findAll();
	}

	public Book createBook(Book b) {
		return bookRepo.save(b);
	}

	public Book editBook(Book b) {
		return bookRepo.save(b);
	}

	public Book findBook(Long id) {
		Optional<Book> option = bookRepo.findById(id);

		if (option.isPresent()) {
			return option.get();
		} else {
			return null;
		}
	}

	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}

}
