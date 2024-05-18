package examen_3TrimestreB.examen.modelo;

public class ActorPrincipal extends Actor {

	public ActorPrincipal(String nombre) {
		super(nombre);		
	}

	private Pelicula peliculaActorPrincipal;
	
	public Pelicula getPeliculaActorPrincipal() {
		return peliculaActorPrincipal;
	}

	public void setPeliculaActorPrincipal(Pelicula peliculaActorPrincipal) {
		this.peliculaActorPrincipal = peliculaActorPrincipal;
	}

}
