import '/domain/entities/quest.dart';

abstract class MainQuestsLocalDatasource {
  List<Quest> getMainQuests();
}

class MainQuestsLocalDatasourceImpl implements MainQuestsLocalDatasource {
  @override
  List<Quest> getMainQuests() {
    return const [
      // Acto I: Inicio
      Quest(
        id: '1',
        name: 'Prisionero',
        description: 'Escapa de Helgen',
        location: 'Helgen',
        prerequisite: 'Ninguno',
      ),
      Quest(
        id: '2',
        name: 'Antes de la Tormenta',
        description: 'Informa al Jarl Balgruuf sobre el dragón',
        location: 'Carrera Blanca',
        prerequisite: 'Prisionero',
      ),
      Quest(
        id: '3',
        name: 'El Camino de la Voz',
        description: 'Visita a los Barbas Grises',
        location: 'Alto Hrothgar',
        prerequisite: 'Antes de la Tormenta',
      ),
      Quest(
        id: '4',
        name: 'El Cuerno de Jurgen Llamador del Viento',
        description: 'Recupera el Cuerno de Jurgen Llamador del Viento',
        location: 'Túmulo de las Cataratas Lúgubres',
        prerequisite: 'El Camino de la Voz',
      ),

      // Acto II: Alduin
      Quest(
        id: '5',
        name: 'Una Cuchilla en la Oscuridad',
        description:
            'Encuentra a Delphine y descubre la verdad sobre los dragones',
        location: 'Posada del Gigante Dormido, Riverwood',
        prerequisite: 'El Cuerno de Jurgen',
      ),
      Quest(
        id: '6',
        name: 'Pared de Alduin',
        description: 'Aprende sobre la profecía en el Templo del Cielo',
        location: 'Templo del Cielo',
        prerequisite: 'Una Cuchilla en la Oscuridad',
      ),
      Quest(
        id: '7',
        name: 'Diplomacia Altmer',
        description: 'Infiltrate en la Embajada Thalmor',
        location: 'Embajada Thalmor',
        prerequisite: 'Pared de Alduin',
      ),
      Quest(
        id: '8',
        name: 'El Conocimiento Prohibido',
        description: 'Encuentra a Esbern en la Ratway',
        location: 'Riften',
        prerequisite: 'Diplomacia Altmer',
      ),

      // Acto III: El Pergamino Antiguo
      Quest(
        id: '9',
        name: 'El Pergamino Antiguo',
        description: 'Recupera el Pergamino Antiguo',
        location: 'Torre de Mzark, Blackreach',
        prerequisite: 'El Conocimiento Prohibido',
      ),
      Quest(
        id: '10',
        name: 'Garganta del Mundo',
        description: 'Lee el Pergamino Antiguo en la Garganta del Mundo',
        location: 'Garganta del Mundo',
        prerequisite: 'El Pergamino Antiguo',
      ),

      // Acto IV: Final
      Quest(
        id: '11',
        name: 'Alduin\'s Bane',
        description: 'Enfrenta a Alduin en la Garganta del Mundo',
        location: 'Garganta del Mundo',
        prerequisite: 'Garganta del Mundo',
      ),
      Quest(
        id: '12',
        name: 'El Caído',
        description: 'Captura y doma al dragón Odahviing',
        location: 'Carrera Blanca',
        prerequisite: 'Alduin\'s Bane',
      ),
      Quest(
        id: '13',
        name: 'Matadragones',
        description: 'Viaja a Sovngarde y derrota a Alduin',
        location: 'Sovngarde',
        prerequisite: 'El Caído',
      ),

      // Misiones Secundarias Principales
      Quest(
        id: '14',
        name: 'La Caída de la Torre de Vigilancia Oeste',
        description: 'Ayuda a defender la Torre de Vigilancia Oeste',
        location: 'Torre de Vigilancia Oeste',
        prerequisite: 'Antes de la Tormenta',
      ),
      Quest(
        id: '15',
        name: 'Palabra de Poder: Páramo del Martillo Blanco',
        description: 'Encuentra la palabra de poder en el Páramo',
        location: 'Páramo del Martillo Blanco',
        prerequisite: 'El Camino de la Voz',
      ),
    ];
  }
}
