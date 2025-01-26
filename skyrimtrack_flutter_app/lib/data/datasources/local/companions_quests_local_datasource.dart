import '/domain/entities/quest.dart';

abstract class CompanionsQuestsLocalDatasource {
  List<Quest> getCompanionsQuests();
}

class CompanionsQuestsLocalDatasourceImpl
    implements CompanionsQuestsLocalDatasource {
  @override
  List<Quest> getCompanionsQuests() {
    return const [
      // Iniciación
      Quest(
        id: '1',
        name: 'Asoma tus Garras',
        description: 'Demuestra tu valía en una pelea contra Vilkas',
        location: 'Jorrvaskr, Carrera Blanca',
        prerequisite: 'Ninguno',
      ),
      Quest(
        id: '2',
        name: 'Entrega de Armas',
        description: 'Entrega la espada de Eorlund a Aela',
        location: 'Jorrvaskr',
        prerequisite: 'Asoma tus Garras',
      ),

      // Misiones Principales
      Quest(
        id: '3',
        name: 'Problemas en Carrera Blanca',
        description: 'Ayuda a Farkas a enfrentar a unos delincuentes',
        location: 'Carrera Blanca',
        prerequisite: 'Entrega de Armas',
      ),
      Quest(
        id: '4',
        name: 'Prueba de Honor',
        description: 'Recupera un fragmento de Wuuthrad',
        location: 'Cripta de Dustman',
        prerequisite: 'Problemas en Carrera Blanca',
      ),
      Quest(
        id: '5',
        name: 'La Plata y la Luna',
        description: 'Acepta el don de la sangre de lobo',
        location: 'Sotobosque',
        prerequisite: 'Prueba de Honor',
      ),
      Quest(
        id: '6',
        name: 'Sangre del Lobo',
        description: 'Busca una cura para la licantropía de Kodlak',
        location: 'Tumba de Ysgramor',
        prerequisite: 'La Plata y la Luna',
      ),
      Quest(
        id: '7',
        name: 'Gloria de los Muertos',
        description: 'Honra a Kodlak y conviértete en Harbinger',
        location: 'Tumba de Ysgramor',
        prerequisite: 'Sangre del Lobo',
      ),

      // Misiones del Círculo
      Quest(
        id: '8',
        name: 'Cazadores de Brujas',
        description: 'Ayuda a Aela a vengarse de la Mano de Plata',
        location: 'Varios lugares',
        prerequisite: 'La Plata y la Luna',
      ),
      Quest(
        id: '9',
        name: 'Venganza sin Fin',
        description: 'Continúa la venganza contra la Mano de Plata',
        location: 'Varios lugares',
        prerequisite: 'Cazadores de Brujas',
      ),
      Quest(
        id: '10',
        name: 'Pureza',
        description: 'Ayuda a un miembro del Círculo a curarse',
        location: 'Tumba de Ysgramor',
        prerequisite: 'Gloria de los Muertos',
      ),

      // Misiones Radiales
      Quest(
        id: '11',
        name: 'Bestias Problemáticas',
        description: 'Elimina bestias peligrosas',
        location: 'Varios lugares',
        prerequisite: 'Entrega de Armas',
      ),
      Quest(
        id: '12',
        name: 'Disciplina Familiar',
        description: 'Intimida a un objetivo problemático',
        location: 'Varios lugares',
        prerequisite: 'Entrega de Armas',
      ),
      Quest(
        id: '13',
        name: 'Rescate',
        description: 'Rescata a un ciudadano secuestrado',
        location: 'Varios lugares',
        prerequisite: 'Entrega de Armas',
      ),
      Quest(
        id: '14',
        name: 'Trabajo de Escolta',
        description: 'Escolta a un ciudadano a su destino',
        location: 'Varios lugares',
        prerequisite: 'Entrega de Armas',
      ),
      Quest(
        id: '15',
        name: 'Robo de Reliquia',
        description: 'Recupera una reliquia robada',
        location: 'Varios lugares',
        prerequisite: 'Entrega de Armas',
      ),
    ];
  }
}
