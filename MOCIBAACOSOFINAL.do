describe acosoCibernetico EDAD genero EducacionOriginal P7_4 P4_09
tab acosoCibernetico
tab EDAD
tab genero
tab EducacionOriginal 
tab P7_4
tab P4_09

*Verificamos que tipo de datos son las variables antes de trabajar *
describe P4_01 SEXO EDAD NIVEL P7_4 P4_09
*Replazamos los tipos de datos String a byte*
destring P4_01 SEXO EDAD NIVEL P7_4 P4_09, replace
*verificamos que esten en byte*
describe P4_01 SEXO EDAD NIVEL P7_4 P4_09

*por medio de tab vamos a ver los datos que contiene cada campo y vamos a empezar a generar nuvos campos para conservar los originales*

*Asufrido alguna vez acoso 1=si 0=no *
tab P4_01 
*generamos el nuevo campo y sus datos se acomodan *
gen acosoCibernetico=.
replace acosoCibernetico = 1 if P4_01 == 1 
replace acosoCibernetico = 0 if P4_01 == 2
*verificamos los datos del nuevo campo*
tab acosoCibernetico

*que sexo es 1=hombre 0=Mujer**
tab SEXO
*generamos el nuevo campo y acomodamos los datos*
gen genero=.
replace genero=1 if SEXO == 1
replace genero=0 if SEXO == 2

*Verificamos los datos *
tab genero

*Edad veremos los datos y acomodaremos *
tab EDAD
*unicamente crearemos un campo nuevo y pasaremos los datos*
gen edad=EDAD
*verificamos que este correcto los datos*
tab edad

*nivel es educaion unicamente crearemos un nuevo campo y lo pasamos tal cual excepto 99*
tab NIVEL
gen educacion=NIVEL
tab educacion
*Eliminamos 99*
drop if educacion >= 12
*comprobamos con tab *
tab educacion


*Tiempo que pasan en linea en internet*
*Lo pasaremos tal cual y veresmo que datos se deben eliminar*
tab P7_4
gen tiempoLinea=P7_4
tab tiempoLinea

* P4_09 Ha recibido algun tipo de contenido sexual*
tab P4_09
gen contenido=P4_09
replace contenido = 1 if P4_09==1
replace contenido = 0 if P4_09==2
tab contenido


*hacemos el logit*

logit acosoCibernetico genero edad educacion tiempoLinea contenido

predic acosoCibernetico_pro

gen= acosoEdad = acosoCibernetico*edad
 graph twoway ( scatter  acosoEdad tiempoLinea) (lfit acosoEdad tiempoLinea)


