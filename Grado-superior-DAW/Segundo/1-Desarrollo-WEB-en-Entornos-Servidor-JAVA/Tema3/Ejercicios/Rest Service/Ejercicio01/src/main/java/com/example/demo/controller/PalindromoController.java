package com.example.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
public class PalindromoController {

	@GetMapping("/validar-palindromo/{palabra}")
	public String ValidarPalindromo(@PathVariable String palabra) {
		String palabraInvertida = "";

		for (int i = palabra.length(); i > 0; i--) {
			palabraInvertida += palabra.substring(i - 1, i);
		}

		if (palabraInvertida.equals(palabra)) {
			return "Es palíndroma";
		} else {
			return "No es palíndroma";
		}

	}

}
