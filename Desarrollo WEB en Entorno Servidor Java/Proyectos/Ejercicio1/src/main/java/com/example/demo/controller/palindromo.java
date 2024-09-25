package com.example.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@RestController
public class palindromo {
	
	@GetMapping("/validar-palindromo/{name}")
	public String validarPalindromo(@PathVariable String name) {
		
		String original = name;
		//String originalDelReves = "";
		
		for (int i = original.length(); i < 0; i--) {
			
		}
		
		return name;
	}
}
