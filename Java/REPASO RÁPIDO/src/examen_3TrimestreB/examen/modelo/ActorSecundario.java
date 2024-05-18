package examen_3TrimestreB.examen.modelo;

import java.math.BigDecimal;

public class ActorSecundario extends Actor {

	public ActorSecundario(String nombre) {
		super(nombre);
	}

	private Integer porcentajeDedicacionActorSecundario;

	public Integer getPorcentajeDedicacionActorSecundario() {
		return porcentajeDedicacionActorSecundario;
	}

	public void setPorcentajeDedicacionActorSecundario(Integer porcentajeDedicacionActorSecundario) {
		this.porcentajeDedicacionActorSecundario = porcentajeDedicacionActorSecundario;
	}

	public BigDecimal getCoste() {		
		return new BigDecimal(this.getPorcentajeDedicacionActorSecundario()).multiply(getCacheActor())
				.divide(new BigDecimal(100));		 
	}

}
