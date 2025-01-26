import '/domain/entities/quest.dart';

abstract class ThievesGuildQuestsLocalDatasource {
  List<Quest> getThievesGuildQuests();
}

class ThievesGuildQuestsLocalDatasourceImpl
    implements ThievesGuildQuestsLocalDatasource {
  @override
  List<Quest> getThievesGuildQuests() {
    return const [
      // Iniciación
      Quest(
        id: '1',
        name: 'Un Chance de Honor',
        description: 'Ayuda a Brynjolf con su estafa en el mercado',
        location: 'Riften',
        prerequisite: 'Ninguno',
      ),
      Quest(
        id: '2',
        name: 'Asuntos Pendientes',
        description: 'Cobra las deudas pendientes',
        location: 'Riften',
        prerequisite: 'Un Chance de Honor',
      ),

      // Misiones Principales
      Quest(
        id: '3',
        name: 'Ruiseñor',
        description: 'Investiga a Goldenglow Estate',
        location: 'Goldenglow Estate',
        prerequisite: 'Asuntos Pendientes',
      ),
      Quest(
        id: '4',
        name: 'Miel y Sangre',
        description: 'Investiga la Destilería de Hidromiel',
        location: 'Destilería de Hidromiel del Prado Negro',
        prerequisite: 'Ruiseñor',
      ),
      Quest(
        id: '5',
        name: 'Hablando con el Silencio',
        description: 'Ayuda a Mercer a investigar a Karliah',
        location: 'Túmulo de las Nieves',
        prerequisite: 'Miel y Sangre',
      ),
      Quest(
        id: '6',
        name: 'Búsqueda Dura',
        description: 'Traduce el diario de Gallus',
        location: 'Markarth',
        prerequisite: 'Hablando con el Silencio',
      ),
      Quest(
        id: '7',
        name: 'La Búsqueda del Ojo',
        description: 'Recupera el Ojo de los Falmer',
        location: 'Ruinas de Irkngthand',
        prerequisite: 'Búsqueda Dura',
      ),
      Quest(
        id: '8',
        name: 'Cegado',
        description: 'Enfrenta a Mercer Frey',
        location: 'Ruinas de Irkngthand',
        prerequisite: 'La Búsqueda del Ojo',
      ),
      Quest(
        id: '9',
        name: 'Oscuridad Devuelta',
        description: 'Restaura el Gremio a su antigua gloria',
        location: 'Riften',
        prerequisite: 'Cegado',
      ),

      // Misiones de Influencia
      Quest(
        id: '10',
        name: 'El Rastro de las Sombras',
        description: 'Completa trabajos especiales en Markarth',
        location: 'Markarth',
        prerequisite: 'Oscuridad Devuelta',
      ),
      Quest(
        id: '11',
        name: 'Diplomacia Sigilosa',
        description: 'Completa trabajos especiales en Solitude',
        location: 'Solitude',
        prerequisite: 'Oscuridad Devuelta',
      ),
      Quest(
        id: '12',
        name: 'Entrega Garantizada',
        description: 'Completa trabajos especiales en Windhelm',
        location: 'Windhelm',
        prerequisite: 'Oscuridad Devuelta',
      ),
      Quest(
        id: '13',
        name: 'Negocios Sucios',
        description: 'Completa trabajos especiales en Whiterun',
        location: 'Whiterun',
        prerequisite: 'Oscuridad Devuelta',
      ),

      // Trabajos Radiales
      Quest(
        id: '14',
        name: 'Trabajos de Delvin',
        description: 'Completa trabajos de números, pesca o cacería',
        location: 'Varios lugares',
        prerequisite: 'Asuntos Pendientes',
      ),
      Quest(
        id: '15',
        name: 'Trabajos de Vex',
        description: 'Completa trabajos de robo, falsificación o sabotaje',
        location: 'Varios lugares',
        prerequisite: 'Asuntos Pendientes',
      ),
      Quest(
        id: '16',
        name: 'Tributo del Gremio',
        description: 'Completa trabajos radiales en las principales ciudades',
        location: 'Varias ciudades',
        prerequisite: 'Oscuridad Devuelta',
      ),
    ];
  }
}
