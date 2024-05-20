package examen_3Trimestre_B.examen.modelo;

import java.math.BigDecimal;
import java.util.Objects;

public class Actor {

	private String nombreArtisticoActor;
	private BigDecimal cacheActor;

	public Actor(String nombre) {
		this.cacheActor = BigDecimal.ZERO;
	}

	public String getNombreActor() {
		return nombreArtisticoActor;
	}

	public void setNombreActor(String nombreActor) {
		this.nombreArtisticoActor = nombreActor;
	}

	public BigDecimal getCacheActor() {
		return cacheActor;
	}

	public void setCacheActor(BigDecimal cacheActor) {
		this.cacheActor = cacheActor;
	}

	public BigDecimal getCoste() {
		return this.cacheActor;

	}

	@Override
	public int hashCode() {
		return Objects.hash(nombreArtisticoActor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Actor other = (Actor) obj;
		return Objects.equals(nombreArtisticoActor, other.nombreArtisticoActor);
	}

}
