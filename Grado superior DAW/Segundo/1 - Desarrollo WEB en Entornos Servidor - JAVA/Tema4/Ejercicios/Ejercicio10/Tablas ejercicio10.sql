SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE oficina;
DROP TABLE reservas;
DROP TABLE empleado;

/*CREATE TABLE `oficina` (
`id` INT NOT NULL AUTO_INCREMENT,
 `ubicacion` VARCHAR(255) NOT NULL,
`telefono` VARCHAR(20) NOT NULL, PRIMARY
KEY (`id`) );

CREATE TABLE `empleado`
 ( `id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(100) NOT NULL,
`puesto` VARCHAR(100) NOT NULL,
`email` VARCHAR(100) NOT NULL,
`oficina_id` INT,
PRIMARY KEY (`id`),
FOREIGN KEY (`oficina_id`) REFERENCES
`oficina`(`id`) ON DELETE SET NULL);*/