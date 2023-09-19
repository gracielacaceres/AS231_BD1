UPDATE cliente
	SET
		celular = '922881101'
	WHERE 
		id ='10';

UPDATE cliente
	SET
		celular = '977226604'
	WHERE 
		id ='13';
        
UPDATE cliente
	SET
		activo = 0
	WHERE 
		id ='12'  ;
UPDATE cliente
 SET
		activo = 0
	WHERE 
		id ='14'  ;
UPDATE cliente
	SET
		activo = 0
	WHERE 
		id ='18'  ;
        

UPDATE cliente
	SET
		celular = ''
	WHERE 
		id ='9'  ;
UPDATE cliente
 SET
		celular = ''
	WHERE 
		id ='13'  ;
UPDATE cliente
	SET
		celular = ''
	WHERE 
		id ='17'  ;
        
UPDATE cliente
	SET
		activo = 1,
        email = 'oscar.quiroz@yahoo.es'
	WHERE 
		id ='18'  ;
        
INSERT INTO cliente
(tipo_documento,numero_documento,nombres,apellidos,email,celular,fecha_nacimiento)
VALUES
('DNI','88225463','Gustavo Tadeo','Quispe Solorzano','gustavo.quispe@gmail.com','', STR_TO_DATE('13/10/2001','%d/%m/%Y')),
('DNI','15753595','Daniela','Solis Vargas','daniela.solis@outlook.com','', STR_TO_DATE('09/11/1993','%d/%m/%Y')),
('DNI','763114895','Milton Gregorio','Vasquez Iturrizaga','milton.gregorio@yahoo.es','974815233', STR_TO_DATE('22/06/2004','%d/%m/%Y')),
('DNI','84725001','Veronica','Ancajima Araujo','veronica.ancajima@yahoo.com','', STR_TO_DATE('07/11/1980','%d/%m/%Y')),
('DNI','11228514','Felicita','Marroquin Candela','felicita.marroquin@outlook.com','966001472', STR_TO_DATE('06/06/2006','%d/%m/%Y')),
('DNI','51436952','Luhana','Ortiz Rodriguez','luhana.ortiz@outlook.com','960405017', STR_TO_DATE('25/11/1980','%d/%m/%Y'));

UPDATE prenda
	SET
		precio = "45.00"
	WHERE 
		id ='3'  ;
        
UPDATE prenda
	SET
		descripcion = "Corbata Michi elegante"
	WHERE 
		id ='6'  ;
        
DELETE FROM prenda
WHERE id ='2';
DELETE FROM prenda
WHERE id ='9';

DELETE FROM vendedor
WHERE id ='3';

DELETE FROM cliente
WHERE id='8';
DELETE FROM cliente
WHERE id= '1';

DELETE FROM cliente
WHERE id = "2";
DELETE FROM cliente
WHERE id = "24";
DELETE FROM cliente
WHERE ID ="26";