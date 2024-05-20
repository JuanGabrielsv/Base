package examen_3Trimestre_B.examen.modelo;

public class ActorPrincipal extends Actor {

	public ActorPrincipal(String nombre) {
		super(nombre);		
	}

	private Pelicula peliculaDebutActorPrincipal;

	public Pelicula getPeliculaDebutActorPrincipal() {
		return peliculaDebutActorPrincipal;
	}

	public void setPeliculaDebutActorPrincipal(Pelicula peliculaDebutActorPrincipal) {
		this.peliculaDebutActorPrincipal = peliculaDebutActorPrincipal;
	}

}
