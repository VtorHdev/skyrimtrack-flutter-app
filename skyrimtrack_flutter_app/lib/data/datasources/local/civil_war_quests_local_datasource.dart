import '/domain/entities/quest.dart';

abstract class CivilWarQuestsLocalDatasource {
  List<Quest> getCivilWarQuests();
}

class CivilWarQuestsLocalDatasourceImpl
    implements CivilWarQuestsLocalDatasource {
  @override
  List<Quest> getCivilWarQuests() {
    return const [
      // Prólogo
      Quest(
        id: '1',
        name: 'Desatado',
        description: 'Escapa de la ejecución en Helgen',
        location: 'Helgen',
        prerequisite: 'Ninguno',
      ),

      // Misiones Imperiales
      Quest(
        id: '2',
        name: 'Únete a la Legión Imperial',
        description: 'Alístate en la Legión Imperial',
        location: 'Solitude',
        prerequisite: 'Desatado',
      ),
      Quest(
        id: '3',
        name: 'Mensaje a Whiterun',
        description: 'Entrega un mensaje al Jarl Balgruuf',
        location: 'Whiterun',
        prerequisite: 'Únete a la Legión Imperial',
      ),
      Quest(
        id: '4',
        name: 'Defensa de Whiterun',
        description: 'Defiende Whiterun del ataque Stormcloak',
        location: 'Whiterun',
        prerequisite: 'Mensaje a Whiterun',
      ),
      Quest(
        id: '5',
        name: 'Reunificación de Skyrim',
        description: 'Reconquista las fortalezas para el Imperio',
        location: 'Varios lugares',
        prerequisite: 'Defensa de Whiterun',
      ),
      Quest(
        id: '6',
        name: 'Batalla por Windhelm',
        description: 'Asalta Windhelm y derrota a Ulfric',
        location: 'Windhelm',
        prerequisite: 'Reunificación de Skyrim',
      ),

      // Misiones Stormcloak
      Quest(
        id: '7',
        name: 'Únete a los Stormcloaks',
        description: 'Alístate en el ejército Stormcloak',
        location: 'Windhelm',
        prerequisite: 'Desatado',
      ),
      Quest(
        id: '8',
        name: 'Mensaje a Whiterun (Stormcloak)',
        description: 'Entrega el hacha de Ulfric al Jarl Balgruuf',
        location: 'Whiterun',
        prerequisite: 'Únete a los Stormcloaks',
      ),
      Quest(
        id: '9',
        name: 'Batalla por Whiterun',
        description: 'Conquista Whiterun para los Stormcloaks',
        location: 'Whiterun',
        prerequisite: 'Mensaje a Whiterun (Stormcloak)',
      ),
      Quest(
        id: '10',
        name: 'Liberación de Skyrim',
        description: 'Conquista las fortalezas para los Stormcloaks',
        location: 'Varios lugares',
        prerequisite: 'Batalla por Whiterun',
      ),
      Quest(
        id: '11',
        name: 'Batalla por Solitude',
        description: 'Asalta Solitude y derrota al General Tullius',
        location: 'Solitude',
        prerequisite: 'Liberación de Skyrim',
      ),

      // Misiones de Fortalezas Imperiales
      Quest(
        id: '12',
        name: 'La Marca Pálida',
        description: 'Conquista/Defiende Fuerte Dunstad',
        location: 'Fuerte Dunstad',
        prerequisite: 'Defensa/Batalla por Whiterun',
      ),
      Quest(
        id: '13',
        name: 'El Alcance',
        description: 'Conquista/Defiende Fuerte Sungard',
        location: 'Fuerte Sungard',
        prerequisite: 'Defensa/Batalla por Whiterun',
      ),
      Quest(
        id: '14',
        name: 'Hjaalmarco',
        description: 'Conquista/Defiende Fuerte Snowhawk',
        location: 'Fuerte Snowhawk',
        prerequisite: 'Defensa/Batalla por Whiterun',
      ),
      Quest(
        id: '15',
        name: 'La Grieta',
        description: 'Conquista/Defiende Fuerte Greenwall',
        location: 'Fuerte Greenwall',
        prerequisite: 'Defensa/Batalla por Whiterun',
      ),
      Quest(
        id: '16',
        name: 'Falkreath',
        description: 'Conquista/Defiende Fuerte Neugrad',
        location: 'Fuerte Neugrad',
        prerequisite: 'Defensa/Batalla por Whiterun',
      ),
    ];
  }
}
