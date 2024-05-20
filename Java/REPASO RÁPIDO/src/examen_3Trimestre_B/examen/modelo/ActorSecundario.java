package examen_3Trimestre_B.examen.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;

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
	
	@Override
	public BigDecimal getCoste() {
		return new BigDecimal(this.getPorcentajeDedicacionActorSecundario()).multiply(getCacheActor())
				.divide(new BigDecimal(100)).setScale(2, RoundingMode.HALF_DOWN);
	}

}
