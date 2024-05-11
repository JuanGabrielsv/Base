package Ejercicio_repaso_final_B.Servicios;

import java.sql.SQLException;

public class LibroException extends SQLException {
	
	private static final long serialVersionUID = 1L;

	public LibroException() {
		// TODO Auto-generated constructor stub
	}

	public LibroException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public LibroException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public LibroException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public LibroException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super();
		// TODO Auto-generated constructor stub
	}

}
