/*
EJERCICIO 59
Crear una clase que se llame Geografia que contenga un atributo que sea un mapa llamado
paises de String → String, donde la clave es el nombre del país y el valor su capital. Tendrá los
métodos:

	1. agregarPais. Recibe un país y su capital y lo añade al mapa. El país lo guardará siempre
	   en mayúsculas y la capital la guardará con la primera letra sólo en mayúsculas. Si el país
	   ya está en el mapa, actualizará la nueva capital. Devolverá true si el país estaba en el
	   mapa y false si no estaba.
	2. obtenerCapital. Recibe un país y devuelve la capital de dicho país. En caso de que no
	   exista el pais en el mapa, devolverá la cadena vacía. OJO: el país puede que lo recibas
	   en minúsculas.
	3. imprimirPaises: imprime el mapa de la siguiente manera: PAIS: “país” – CAPITAL:
	   “capital” (uno en cada línea)
	4. eliminarPais: Recibe un país y borra la entrada del mapa de dicho país si existe. OJO: el
	   país puede que lo recibas en minúsculas.
	5. calcularLongitudMediaPaises. Devuelve la media del número de caracteres que tiene el
	   nombre de los países. Es decir, la suma total de caracteres de todos los nombres de los
	   países entre la cantidad. Si no tenemos países, debe devolver 0.
	6. eliminarPaisConCapitalLetra: Recibe una letra, y elimina del mapa la entrada donde la
	   capital comience por letra especificada. Eliminará sólo la primera ocurrencia del mapa
	   que coincida.
	7. numeroPaisesConCapitalLetra: Recibe una letra y devuelve el número de países cuya
	   capital comience con la letra especificada.
	8. imprimirNumeroPaisesLetra: Recibe una letra e imprimirá las entradas del mapa cuya
	   capital empiece por la letra especificada. Si no hay ninguna, imprimir: “Ninguna capital
	   del mapa comienza por (”letra”). Suponemos que la letra recibida no está vacía ni es
	   null.	   
	9. mismaLetra: No recibe nada. Imprime las entradas del mapa cuyo nombre y su capital
	   comiencen por la misma letra. Si no hay ninguna, imprimirá: no hay ningún país y capital
	   que comiencen por la misma letra.
	   
Crea un programa que pida 5 países con capitales y las guarde en el mapa. Si el país ya estaba
insertado no cuenta como uno de los 5.

		Ejemplo de prueba:
			 Egipto → El Cairo
			 Suiza → Berna
			 Austria → Praga
			 Hungría → Budapest
			 Austria → Viena
			 Brasil → Brasilia
	 
A continuación:

• Imprime el mapa completo.
• Calcula el promedio del número de letras que contienen los países.
• Solicita una letra y muestra los países cuya capital empiezan por dicha letra: Ejemplo B
• Muestra los países cuyo nombre y capital comiencen por la misma letra.
• Elimina el primer país que encuentre cuya capital comience por la letra solicitada
  anteriormente.
• Vuelve a mostrar el número de países con capitales que comiencen por dicha letra. 
*/
package ejercicios_básicos_ejercicio_59;

public class Geografia {

}
