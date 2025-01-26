import '/domain/entities/quest.dart';

abstract class WinterholdQuestsLocalDatasource {
  List<Quest> getWinterholdQuests();
}

class WinterholdQuestsLocalDatasourceImpl
    implements WinterholdQuestsLocalDatasource {
  @override
  List<Quest> getWinterholdQuests() {
    return const [
      // Misiones de Ingreso
      Quest(
        id: '1',
        name: 'Primera Lección',
        description: 'Demuestra tu valía para ingresar al Colegio',
        location: 'Puente de Hibernalia',
        prerequisite: 'Ninguno',
      ),
      Quest(
        id: '2',
        name: 'Bajo Saarthal',
        description: 'Acompaña a Tolfdir en una excavación arqueológica',
        location: 'Saarthal',
        prerequisite: 'Primera Lección',
      ),

      // Misiones Principales del Colegio
      Quest(
        id: '3',
        name: 'Revelando lo Invisible',
        description: 'Busca los libros sobre el Ojo de Magnus',
        location: 'Festín del Mago',
        prerequisite: 'Bajo Saarthal',
      ),
      Quest(
        id: '4',
        name: 'Contención',
        description: 'Ayuda a contener la anomalía mágica en Hibernalia',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Revelando lo Invisible',
      ),
      Quest(
        id: '5',
        name: 'El Personal de Magnus',
        description: 'Recupera el Personal de Magnus',
        location: 'Laberinto',
        prerequisite: 'Contención',
      ),
      Quest(
        id: '6',
        name: 'El Ojo de Magnus',
        description: 'Enfrenta a Ancano y salva el Colegio',
        location: 'Colegio de Hibernalia',
        prerequisite: 'El Personal de Magnus',
      ),

      // Misiones de las Escuelas de Magia
      Quest(
        id: '7',
        name: 'Rituales de Alteración',
        description: 'Demuestra tu maestría en Alteración',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Nivel 90 en Alteración',
      ),
      Quest(
        id: '8',
        name: 'Rituales de Conjuración',
        description: 'Invoca un dremora permanente',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Nivel 90 en Conjuración',
      ),
      Quest(
        id: '9',
        name: 'Rituales de Destrucción',
        description: 'Aprende hechizos maestros de Destrucción',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Nivel 90 en Destrucción',
      ),
      Quest(
        id: '10',
        name: 'Rituales de Ilusión',
        description: 'Demuestra tu dominio de la Ilusión',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Nivel 90 en Ilusión',
      ),
      Quest(
        id: '11',
        name: 'Rituales de Restauración',
        description: 'Prueba tu valía en Restauración',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Nivel 90 en Restauración',
      ),

      // Misiones Secundarias del Colegio
      Quest(
        id: '12',
        name: 'Buenos Intentos',
        description: 'Ayuda a J\'zargo a probar sus pergaminos',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Primera Lección',
      ),
      Quest(
        id: '13',
        name: 'Fragmentos de Arniel',
        description: 'Ayuda a Arniel con su proyecto de investigación',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Primera Lección',
      ),
      Quest(
        id: '14',
        name: 'Investigación de Onmund',
        description: 'Ayuda a Onmund a recuperar su reliquia familiar',
        location: 'Varios lugares',
        prerequisite: 'Primera Lección',
      ),
      Quest(
        id: '15',
        name: 'Brelyna\'s Practice',
        description: 'Ayuda a Brelyna con sus experimentos de Alteración',
        location: 'Colegio de Hibernalia',
        prerequisite: 'Primera Lección',
      ),
    ];
  }
}
