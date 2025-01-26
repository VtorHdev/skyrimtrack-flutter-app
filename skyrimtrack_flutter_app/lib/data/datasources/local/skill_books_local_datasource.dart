import '/domain/entities/skill_book.dart';

abstract class SkillBooksLocalDatasource {
  List<SkillBook> getSkillBooks();
}

class SkillBooksLocalDatasourceImpl implements SkillBooksLocalDatasource {
  @override
  List<SkillBook> getSkillBooks() {
    return const [
      // GUERRERO (1-30)
      // Armadura Pesada (1-5)
      SkillBook(
        id: '1',
        name: 'Batalla de Rojo Monte',
        skill: 'Armadura Pesada',
        location: 'Fuerte Kastav - En una mesa',
      ),
      SkillBook(
        id: '2',
        name: '2920, MidYear, v6',
        skill: 'Armadura Pesada',
        location: 'Cueva Sombría - En un estante',
      ),
      SkillBook(
        id: '3',
        name: 'Hallazgos de Péndulo',
        skill: 'Armadura Pesada',
        location: 'Cuevas Glaciales - Sobre un cadáver',
      ),
      SkillBook(
        id: '4',
        name: 'Los Caballeros de los Nueve',
        skill: 'Armadura Pesada',
        location: 'Templo de los Divinos, Soledad',
      ),
      SkillBook(
        id: '5',
        name: 'La Armadura del Salvaje',
        skill: 'Armadura Pesada',
        location: 'Tumba de Ysgramor - Sala principal',
      ),

      // Herrería (6-10)
      SkillBook(
        id: '6',
        name: 'El Herrero Inmortal',
        skill: 'Herrería',
        location: 'Herrería Caliente, Carrera Blanca',
      ),
      SkillBook(
        id: '7',
        name: 'El Último Escudo de los Centinelas',
        skill: 'Herrería',
        location: 'Mina de Gloombound',
      ),
      SkillBook(
        id: '8',
        name: 'Pesada Armadura de los Antiguos',
        skill: 'Herrería',
        location: 'Alquimista Blanco, Morthal',
      ),
      SkillBook(
        id: '9',
        name: 'El Arte Perdido del Herrero',
        skill: 'Herrería',
        location: 'Herrería de Lakeview Manor',
      ),
      SkillBook(
        id: '10',
        name: 'Los Herreros de Soledad',
        skill: 'Herrería',
        location: 'Herrería de Beirand, Soledad',
      ),

      // Bloqueo (11-15)
      SkillBook(
        id: '11',
        name: 'La Batalla de Rojo Monte',
        skill: 'Bloqueo',
        location: 'Torre de Valtheim',
      ),
      SkillBook(
        id: '12',
        name: 'Guerreros de la Tormenta',
        skill: 'Bloqueo',
        location: 'Campamento de Bandidos Silencioso',
      ),
      SkillBook(
        id: '13',
        name: 'El Escudo Espejo',
        skill: 'Bloqueo',
        location: 'Fuerte Dunstad - Torre del Capitán',
      ),
      SkillBook(
        id: '14',
        name: 'La Danza de la Muerte',
        skill: 'Bloqueo',
        location: 'Cueva del Troll Helado',
      ),
      SkillBook(
        id: '15',
        name: 'Escudo y Sombra',
        skill: 'Bloqueo',
        location: 'Fuerte Neugrad - Prisión',
      ),

      // Armas a Una Mano (16-20)
      SkillBook(
        id: '16',
        name: 'Guerreros del Hielo',
        skill: 'Armas a Una Mano',
        location: 'Cueva del Río Helado',
      ),
      SkillBook(
        id: '17',
        name: '2920, MorningStar, v1',
        skill: 'Armas a Una Mano',
        location: 'Ruinas de Folgunthur',
      ),
      SkillBook(
        id: '18',
        name: 'Fuego y Oscuridad',
        skill: 'Armas a Una Mano',
        location: 'Cueva Emboscada',
      ),
      SkillBook(
        id: '19',
        name: 'La Importancia del Lugar',
        skill: 'Armas a Una Mano',
        location: 'Campamento Gigante Cima Quebrada',
      ),
      SkillBook(
        id: '20',
        name: 'Noche Cae en Sentinel',
        skill: 'Armas a Una Mano',
        location: 'Cueva Solitaria',
      ),

      // Armas a Dos Manos (21-25)
      SkillBook(
        id: '21',
        name: 'Canción del Hacha',
        skill: 'Armas a Dos Manos',
        location: 'Tumba del Rey Olaf',
      ),
      SkillBook(
        id: '22',
        name: 'La Leyenda de Krately House',
        skill: 'Armas a Dos Manos',
        location: 'Cueva del Brujo Muerto',
      ),
      SkillBook(
        id: '23',
        name: 'El Libro de Círculos',
        skill: 'Armas a Dos Manos',
        location: 'Fuerte Greymoor',
      ),
      SkillBook(
        id: '24',
        name: 'Rey',
        skill: 'Armas a Dos Manos',
        location: 'Salas Nórdicas',
      ),
      SkillBook(
        id: '25',
        name: 'Palabras y Filosofía',
        skill: 'Armas a Dos Manos',
        location: 'Cueva del Gigante Partido',
      ),

      // Armadura Ligera (26-30)
      SkillBook(
        id: '26',
        name: 'Hielo y Quitina',
        skill: 'Armadura Ligera',
        location: 'Cueva Glacial',
      ),
      SkillBook(
        id: '27',
        name: 'Padre de la Serpiente Niben',
        skill: 'Armadura Ligera',
        location: 'Fuerte Amol',
      ),
      SkillBook(
        id: '28',
        name: 'Rislav el Justo',
        skill: 'Armadura Ligera',
        location: 'Cueva del Brujo',
      ),
      SkillBook(
        id: '29',
        name: 'La Guía del Aventurero',
        skill: 'Armadura Ligera',
        location: 'Posada Vilemyr, Ivarstead',
      ),
      SkillBook(
        id: '30',
        name: 'La Armadura de los Refugiados',
        skill: 'Armadura Ligera',
        location: 'Campamento Imperial',
      ),

      // LADRÓN (31-60)
      // Sigilo
      SkillBook(
        id: '31',
        name: 'Sombras y Luz',
        skill: 'Sigilo',
        location: 'Gremio de Ladrones, Riften',
      ),
      SkillBook(
        id: '32',
        name: 'Tres Ladrones',
        skill: 'Sigilo',
        location: 'Cueva del Bandido',
      ),
      SkillBook(
        id: '33',
        name: 'La Guía del Ladrón',
        skill: 'Sigilo',
        location: 'Ratway Warrens',
      ),
      SkillBook(
        id: '34',
        name: '2920, Último Semilla, v8',
        skill: 'Sigilo',
        location: 'Torre Ilinalta',
      ),
      SkillBook(
        id: '35',
        name: 'Arte Sagrado del Sigilo',
        skill: 'Sigilo',
        location: 'Santuario Oscuro de Falkreath',
      ),

      // Discurso
      SkillBook(
        id: '36',
        name: 'Biografía de la Reina Barenziah',
        skill: 'Discurso',
        location: 'Palacio de los Reyes, Soledad',
      ),
      SkillBook(
        id: '37',
        name: 'Guía de Bolsillo para el Imperio',
        skill: 'Discurso',
        location: 'Posada del Gigante Dormido',
      ),
      SkillBook(
        id: '38',
        name: '2920, Segunda Semilla, v5',
        skill: 'Discurso',
        location: 'Colegio de Bardos',
      ),
      SkillBook(
        id: '39',
        name: 'Biografía de la Loba Reina',
        skill: 'Discurso',
        location: 'Biblioteca Arcanaeum',
      ),
      SkillBook(
        id: '40',
        name: 'El Misterio de la Princesa Talara',
        skill: 'Discurso',
        location: 'Palacio Azul, Ventalia',
      ),

      // Forzar Cerraduras
      SkillBook(
        id: '41',
        name: 'El Libro Rojo de Acertijos',
        skill: 'Forzar Cerraduras',
        location: 'Ratway, Riften',
      ),
      SkillBook(
        id: '42',
        name: 'La Habilidad del Ladrón',
        skill: 'Forzar Cerraduras',
        location: 'Cisterna del Gremio de Ladrones',
      ),
      SkillBook(
        id: '43',
        name: 'Cerraduras Surfinas',
        skill: 'Forzar Cerraduras',
        location: 'Torre Rota',
      ),
      SkillBook(
        id: '44',
        name: 'El Lobo Solitario',
        skill: 'Forzar Cerraduras',
        location: 'Cueva del Contrabandista',
      ),
      SkillBook(
        id: '45',
        name: 'Los Ladrones de la Bahía',
        skill: 'Forzar Cerraduras',
        location: 'Prisión de Riften',
      ),

      // Carterismo
      SkillBook(
        id: '46',
        name: 'Pureza de Robo',
        skill: 'Carterismo',
        location: 'Cisterna del Gremio de Ladrones',
      ),
      SkillBook(
        id: '47',
        name: 'Dedos Ligeros',
        skill: 'Carterismo',
        location: 'Ratway Warrens',
      ),
      SkillBook(
        id: '48',
        name: 'El Arte del Hurto',
        skill: 'Carterismo',
        location: 'Cueva del Bandido',
      ),
      SkillBook(
        id: '49',
        name: 'El Príncipe Mendigo',
        skill: 'Carterismo',
        location: 'Mercado de Riften',
      ),
      SkillBook(
        id: '50',
        name: 'Ladrón de Virtud',
        skill: 'Carterismo',
        location: 'Casa de Mercer Frey',
      ),

      // Arquería
      SkillBook(
        id: '51',
        name: 'El Tiro Lejano',
        skill: 'Arquería',
        location: 'Cabaña de Anise',
      ),
      SkillBook(
        id: '52',
        name: 'Vernaccus y Bourlor',
        skill: 'Arquería',
        location: 'Fuerte Amol',
      ),
      SkillBook(
        id: '53',
        name: 'El Oro Pálido',
        skill: 'Arquería',
        location: 'Campamento de Cazadores',
      ),
      SkillBook(
        id: '54',
        name: 'El Arco Negro',
        skill: 'Arquería',
        location: 'Torre del Mago',
      ),
      SkillBook(
        id: '55',
        name: 'La Guía del Arquero',
        skill: 'Arquería',
        location: 'Cueva del Cazador',
      ),

      // MAGO (61-90)
      // Destrucción
      SkillBook(
        id: '56',
        name: 'Danza del Fuego',
        skill: 'Destrucción',
        location: 'Universidad de Hibernalia',
      ),
      SkillBook(
        id: '57',
        name: 'El Arte de la Guerra Mágica',
        skill: 'Destrucción',
        location: 'Sabaoth, Laboratorio',
      ),
      SkillBook(
        id: '58',
        name: 'Horror de Castillo Xyr',
        skill: 'Destrucción',
        location: 'Cueva del Brujo Helado',
      ),
      SkillBook(
        id: '59',
        name: 'Misterio de Talara v3',
        skill: 'Destrucción',
        location: 'Torre Ilinalta',
      ),
      SkillBook(
        id: '60',
        name: 'Respuesta de los Elementos',
        skill: 'Destrucción',
        location: 'Pico Alto, Santuario',
      ),

      // Conjuración
      SkillBook(
        id: '61',
        name: 'El Libro de los Daedra',
        skill: 'Conjuración',
        location: 'Fuerte Amol, Torre',
      ),
      SkillBook(
        id: '62',
        name: 'Puentes Liminales',
        skill: 'Conjuración',
        location: 'Cuevas Heladas',
      ),
      SkillBook(
        id: '63',
        name: 'El Guerrero Espiritual',
        skill: 'Conjuración',
        location: 'Cueva del Brujo',
      ),
      SkillBook(
        id: '64',
        name: '2920, Lluvia Media, v4',
        skill: 'Conjuración',
        location: 'Fuerte Kastav',
      ),
      SkillBook(
        id: '65',
        name: 'Misterios de los Ancestros',
        skill: 'Conjuración',
        location: 'Salas de los Muertos, Carrera Blanca',
      ),

      // Alteración
      SkillBook(
        id: '66',
        name: 'Realidad y Otros Falsos',
        skill: 'Alteración',
        location: 'Cueva del Eco Sombrío',
      ),
      SkillBook(
        id: '67',
        name: 'Los Lunáticos',
        skill: 'Alteración',
        location: 'Cuevas Glaciales',
      ),
      SkillBook(
        id: '68',
        name: 'La Puerta de la Luna',
        skill: 'Alteración',
        location: 'Fuerte Amol',
      ),
      SkillBook(
        id: '69',
        name: 'Hija de la Niben',
        skill: 'Alteración',
        location: 'Cueva del Brujo',
      ),
      SkillBook(
        id: '70',
        name: 'Los Viejos Caminos',
        skill: 'Alteración',
        location: 'Torre del Mago',
      ),

      // Ilusión
      SkillBook(
        id: '71',
        name: 'Antes de la Era del Hombre',
        skill: 'Ilusión',
        location: 'Fuerte Neugrad',
      ),
      SkillBook(
        id: '72',
        name: 'Incidente en Necrom',
        skill: 'Ilusión',
        location: 'Cueva del Eco',
      ),
      SkillBook(
        id: '73',
        name: 'Misterio de Talara, v2',
        skill: 'Ilusión',
        location: 'Torre Ilinalta',
      ),
      SkillBook(
        id: '74',
        name: '2920, Sol del Amanecer, v2',
        skill: 'Ilusión',
        location: 'Cuevas Heladas',
      ),
      SkillBook(
        id: '75',
        name: 'El Espejo Negro',
        skill: 'Ilusión',
        location: 'Santuario Oscuro',
      ),

      // Restauración
      SkillBook(
        id: '76',
        name: 'Las Puertas de los Espíritus',
        skill: 'Restauración',
        location: 'Templo de Kynareth, Carrera Blanca',
      ),
      SkillBook(
        id: '77',
        name: 'Filogenia Racial',
        skill: 'Restauración',
        location: 'Sala de los Muertos, Ventalia',
      ),
      SkillBook(
        id: '78',
        name: '2920, Lluvia de la Estrella, v10',
        skill: 'Restauración',
        location: 'Fuerte Kastav',
      ),
      SkillBook(
        id: '79',
        name: 'Contra la Naturaleza',
        skill: 'Restauración',
        location: 'Cueva del Brujo',
      ),
      SkillBook(
        id: '80',
        name: 'Los Mitos del Sol Naciente',
        skill: 'Restauración',
        location: 'Templo de los Divinos, Soledad',
      ),

      // Encantamiento
      SkillBook(
        id: '81',
        name: 'Un Tratado de Encantamiento',
        skill: 'Encantamiento',
        location: 'Universidad de Hibernalia',
      ),
      SkillBook(
        id: '82',
        name: 'Encantamientos Azura',
        skill: 'Encantamiento',
        location: 'Fuerte Kastav',
      ),
      SkillBook(
        id: '83',
        name: 'Gemas del Poder',
        skill: 'Encantamiento',
        location: 'Torre del Mago',
      ),
      SkillBook(
        id: '84',
        name: 'Encantador Principiante',
        skill: 'Encantamiento',
        location: 'Cuevas Heladas',
      ),
      SkillBook(
        id: '85',
        name: 'Encantamientos Dobles',
        skill: 'Encantamiento',
        location: 'Salas Nórdicas',
      ),

      // Alquimia
      SkillBook(
        id: '86',
        name: 'Canción de los Alquimistas',
        skill: 'Alquimia',
        location: 'Tienda de Arcadia, Carrera Blanca',
      ),
      SkillBook(
        id: '87',
        name: 'De la Peste',
        skill: 'Alquimia',
        location: 'Torre del Mago',
      ),
      SkillBook(
        id: '88',
        name: 'Herbario del Brujo',
        skill: 'Alquimia',
        location: 'Cueva del Brujo',
      ),
      SkillBook(
        id: '89',
        name: 'Mannam de Luna',
        skill: 'Alquimia',
        location: 'Alquimista Blanco, Morthal',
      ),
      SkillBook(
        id: '90',
        name: 'Los Últimos Scourges',
        skill: 'Alquimia',
        location: 'Laboratorio de Sinderion',
      ),
    ];
  }
}
