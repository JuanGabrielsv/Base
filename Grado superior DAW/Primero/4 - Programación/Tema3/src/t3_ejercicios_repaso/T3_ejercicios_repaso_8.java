/* EJERCICIO 8
Haz un programa que extraiga el texto de un HTML ignorando todas las etiquetas. Ejemplo de
ejecución:
Escribe tu HTML
<html><head/><body><h1>Mi página web</h1><h2>Ej 8 de Programación</h2><br/><br/><p>Funciona?</p><p>Sí!!</p></body></html>
Texto extraído:
Mi página webEj 8 de ProgramaciónFunciona?Sí!!  */
package t3_ejercicios_repaso;

public class T3_ejercicios_repaso_8 {
	
	public static final String TEXTO = "<html><head/><body><h1>Mi página web</h1><h2>Ej 8 de Programación</h2><br/><br/><p>Funciona?</p><p>Sí!!</p></body></html>";

	public static void main(String[] args) {
		
		Boolean etiquetaAbierta = true;
		
		String[] arrayTexto = TEXTO.split("");
		
		for (String caracter : arrayTexto) {
			if (caracter.equals("<")) {
				etiquetaAbierta = true;
			}
			else if (caracter.equals(">")) {
				etiquetaAbierta = false;
			}
			else if (etiquetaAbierta == false) {
				System.out.print(caracter);
			}
			
		}				
				
	}

}
