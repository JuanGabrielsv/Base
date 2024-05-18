package examen_3Trimestre_A.examen.app;

import java.math.BigDecimal;
import java.time.LocalDate;

import examen_3Trimestre_A.examen.modelo.Empresa;
import examen_3Trimestre_A.examen.modelo.ProgramadorJunior;
import examen_3Trimestre_A.examen.modelo.ProgramadorSenior;
import examen_3Trimestre_A.examen.modelo.Proyecto;
import examen_3Trimestre_A.examen.services.ProyectoNotFoundException;

public class App {

	public static void main(String[] args) {
		ProgramadorSenior programador1 = new ProgramadorSenior("41950");
		programador1.setAnoAntiguedadProgrmadorSenior(5);
		programador1.setSueldoBaseProgramador(new BigDecimal(2000));
		
		ProgramadorJunior programador2 = new ProgramadorJunior("41951");
		programador2.setSueldoBaseProgramador(new BigDecimal(2000));		
				
		System.out.println(programador1.getSueldoFinal());
		System.out.println(programador2.getSueldoFinal());
		
/******************** CREACIÓN DE PROYECTOS ***************************/	
		
		Proyecto proyecto1 = new Proyecto("001", "Supermercado");
		proyecto1.setFechaInicioProyecto(LocalDate.of(2024, 2, 15));
		proyecto1.setFechaEntregaProyecto(LocalDate.of(2026, 5, 17));
		proyecto1.getListaProgramadoresProyecto();
		proyecto1.setPresupuestoProyecto(new BigDecimal(2000));
		proyecto1.setCosteActualProyecto(new BigDecimal(35000));
		
		Proyecto proyecto2 = new Proyecto("002", "Taller");
		proyecto2.setFechaInicioProyecto(LocalDate.now());
		proyecto2.setFechaEntregaProyecto(LocalDate.of(2025, 9, 1));
		proyecto2.getListaProgramadoresProyecto();
		proyecto2.setPresupuestoProyecto(new BigDecimal(25232.25));
		proyecto2.setCosteActualProyecto(new BigDecimal(15651.41));
		
		System.out.println(proyecto1.getDuracion());
		System.out.println(proyecto1.getPresupuestoRestante());
		System.out.println();
		System.out.println(proyecto1);
		
		Empresa empresa1 = new Empresa();
		Empresa empresa2 = new Empresa();
		proyecto1.getListaProgramadoresProyecto().add(programador2);
		proyecto2.getListaProgramadoresProyecto().add(programador2);
		proyecto1.getListaProgramadoresProyecto().add(programador1);
		
		try {
			empresa2.getListaProyectosEmpresa().add(proyecto2);
			empresa2.getListaProyectosEmpresa().add(proyecto2);
			empresa2.getListaProyectosEmpresa().add(proyecto2);
			empresa1.getListaProyectosEmpresa().add(proyecto2);
			empresa1.getListaProyectosEmpresa().add(proyecto1);
			empresa1.getListaProyectosEmpresa().add(proyecto2);
			
			System.out.println(empresa1.getProyectoMayorEquipo());
			
			
			System.out.println("\nSueldo del proyecto");
			System.out.println(empresa1.getSueldosProyecto("001"));
			
			System.out.println(empresa1.getProyectosActualesSinPresupuesto());
			
			empresa1.setNombreComercialEmpresa("Zero Software");
			System.out.println(empresa2);
			
			
		} catch (ProyectoNotFoundException e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		

	}

}
