package examen_3Trimestre_B.examen.services;

public class PeliculaErrorException extends Exception {

	private static final long serialVersionUID = -4821466066847018242L;

	public PeliculaErrorException() {

	}

	public PeliculaErrorException(String message) {
		super(message);
	}

	public PeliculaErrorException(Throwable cause) {
		super(cause);
	}

	public PeliculaErrorException(String message, Throwable cause) {
		super(message, cause);
	}

	public PeliculaErrorException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
