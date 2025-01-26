import '/domain/entities/quest.dart';

abstract class DaedricQuestsLocalDatasource {
  List<Quest> getDaedricQuests();
}

class DaedricQuestsLocalDatasourceImpl implements DaedricQuestsLocalDatasource {
  @override
  List<Quest> getDaedricQuests() {
    return const [
      // Azura
      Quest(
        id: '1',
        name: 'La Estrella Negra',
        description: 'Recupera y purifica/corrompe la Estrella de Azura',
        location: 'Santuario de Azura',
        prerequisite: 'Nivel 1',
      ),

      // Boethiah
      Quest(
        id: '2',
        name: 'Llamando a Boethiah',
        description: 'Sacrifica un seguidor y completa las pruebas de Boethiah',
        location: 'Santuario de Boethiah',
        prerequisite: 'Nivel 30',
      ),

      // Clavicus Vile
      Quest(
        id: '3',
        name: 'Un Amigo Canino',
        description: 'Ayuda a Barbas y decide su destino',
        location: 'Falkreath',
        prerequisite: 'Nivel 10',
      ),

      // Hermaeus Mora
      Quest(
        id: '4',
        name: 'Discernimiento Discordante',
        description: 'Recolecta conocimiento prohibido para Hermaeus Mora',
        location: 'Academia de Winterhold',
        prerequisite: 'Nivel 15',
      ),

      // Hircine
      Quest(
        id: '5',
        name: 'La Piel del Salvaje',
        description: 'Ayuda al cazador maldito y obtén el anillo de Hircine',
        location: 'Falkreath',
        prerequisite: 'Nivel 1',
      ),

      // Malacath
      Quest(
        id: '6',
        name: 'La Maldición del Pueblo',
        description: 'Ayuda al líder orco a restaurar su fortaleza',
        location: 'Largashbur',
        prerequisite: 'Nivel 1',
      ),

      // Mehrunes Dagon
      Quest(
        id: '7',
        name: 'Fragmentos del Pasado',
        description: 'Reforja la Navaja del Sacrificio',
        location: 'Dawnstar',
        prerequisite: 'Nivel 20',
      ),

      // Mephala
      Quest(
        id: '8',
        name: 'El Susurro de la Ebonita',
        description: 'Obtén la Espada de la Ebonita',
        location: 'Balgruuf\'s Quarters, Whiterun',
        prerequisite: 'Nivel 20',
      ),

      // Meridia
      Quest(
        id: '9',
        name: 'El Faro de Meridia',
        description: 'Limpia el templo de Meridia de los muertos',
        location: 'Templo de Meridia',
        prerequisite: 'Nivel 12',
      ),

      // Molag Bal
      Quest(
        id: '10',
        name: 'La Casa del Horror',
        description: 'Escapa de la casa abandonada y sirve a Molag Bal',
        location: 'Markarth',
        prerequisite: 'Nivel 1',
      ),

      // Namira
      Quest(
        id: '11',
        name: 'El Sabor de la Muerte',
        description: 'Únete al círculo de caníbales de Namira',
        location: 'Markarth',
        prerequisite: 'Nivel 1',
      ),

      // Peryite
      Quest(
        id: '12',
        name: 'Solo los más Enfermos',
        description: 'Limpia el mundo de los seguidores infectados de Peryite',
        location: 'Altar de Peryite',
        prerequisite: 'Nivel 1',
      ),

      // Sanguine
      Quest(
        id: '13',
        name: 'Una Noche para Recordar',
        description:
            'Recupera los recuerdos de tu noche de fiesta con Sanguine',
        location: 'Whiterun',
        prerequisite: 'Nivel 14',
      ),

      // Sheogorath
      Quest(
        id: '14',
        name: 'La Mente de un Loco',
        description: 'Ayuda a Dervenin a encontrar a su maestro',
        location: 'Solitude',
        prerequisite: 'Nivel 1',
      ),

      // Vaermina
      Quest(
        id: '15',
        name: 'Despertar del Sueño',
        description: 'Ayuda a los sacerdotes con los problemas de pesadillas',
        location: 'Dawnstar',
        prerequisite: 'Nivel 1',
      ),

      // Nocturnal (Thieves Guild)
      Quest(
        id: '16',
        name: 'Oscuridad Devuelta',
        description: 'Devuelve la Llave Esquelética a Nocturnal',
        location: 'Riften',
        prerequisite: 'Misiones del Gremio de Ladrones',
      ),
    ];
  }
}
