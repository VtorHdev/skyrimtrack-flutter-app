import '/domain/entities/enchantment.dart';

abstract class EnchantmentsLocalDatasource {
  List<Enchantment> getEnchantments();
}

class EnchantmentsLocalDatasourceImpl implements EnchantmentsLocalDatasource {
  @override
  List<Enchantment> getEnchantments() {
    return const [
      // Armas - Daño Elemental
      Enchantment(
        id: '1',
        name: 'Daño de Fuego',
        effect: 'El objetivo recibe X puntos de daño de fuego',
        type: 'Arma',
      ),
      Enchantment(
        id: '2',
        name: 'Daño de Escarcha',
        effect:
            'El objetivo recibe X puntos de daño de escarcha y ralentización',
        type: 'Arma',
      ),
      Enchantment(
        id: '3',
        name: 'Daño de Descarga',
        effect:
            'El objetivo recibe X puntos de daño de descarga y pierde magia',
        type: 'Arma',
      ),

      // Armas - Absorción
      Enchantment(
        id: '4',
        name: 'Absorber Salud',
        effect: 'Absorbe X puntos de salud',
        type: 'Arma',
      ),
      Enchantment(
        id: '5',
        name: 'Absorber Magia',
        effect: 'Absorbe X puntos de magia',
        type: 'Arma',
      ),
      Enchantment(
        id: '6',
        name: 'Absorber Aguante',
        effect: 'Absorbe X puntos de aguante',
        type: 'Arma',
      ),

      // Armas - Efectos
      Enchantment(
        id: '7',
        name: 'Caos',
        effect: 'Daño aleatorio de fuego, escarcha o descarga',
        type: 'Arma',
      ),
      Enchantment(
        id: '8',
        name: 'Parálisis',
        effect: 'Paraliza al objetivo durante X segundos',
        type: 'Arma',
      ),
      Enchantment(
        id: '9',
        name: 'Capturar Almas',
        effect: 'Atrapa el alma si el objetivo muere en X segundos',
        type: 'Arma',
      ),
      Enchantment(
        id: '10',
        name: 'Marchitamiento',
        effect: 'Reduce la salud máxima del objetivo',
        type: 'Arma',
      ),

      // Armadura - Atributos
      Enchantment(
        id: '11',
        name: 'Fortalecer Salud',
        effect: 'Aumenta la salud en X puntos',
        type: 'Armadura',
      ),
      Enchantment(
        id: '12',
        name: 'Fortalecer Magia',
        effect: 'Aumenta la magia en X puntos',
        type: 'Armadura',
      ),
      Enchantment(
        id: '13',
        name: 'Fortalecer Aguante',
        effect: 'Aumenta el aguante en X puntos',
        type: 'Armadura',
      ),

      // Armadura - Resistencias
      Enchantment(
        id: '14',
        name: 'Resistencia a la Magia',
        effect: 'Reduce el daño mágico recibido en X%',
        type: 'Armadura',
      ),
      Enchantment(
        id: '15',
        name: 'Resistencia al Fuego',
        effect: 'Reduce el daño por fuego en X%',
        type: 'Armadura',
      ),
      Enchantment(
        id: '16',
        name: 'Resistencia a la Escarcha',
        effect: 'Reduce el daño por escarcha en X%',
        type: 'Armadura',
      ),
      Enchantment(
        id: '17',
        name: 'Resistencia a la Descarga',
        effect: 'Reduce el daño por descarga en X%',
        type: 'Armadura',
      ),
      Enchantment(
        id: '18',
        name: 'Resistencia al Veneno',
        effect: 'Reduce el daño por veneno en X%',
        type: 'Armadura',
      ),

      // Armadura - Habilidades
      Enchantment(
        id: '19',
        name: 'Fortalecer Alquimia',
        effect: 'Pociones X% más potentes',
        type: 'Armadura',
      ),
      Enchantment(
        id: '20',
        name: 'Fortalecer Herrería',
        effect: 'Mejoras de herrería X% más efectivas',
        type: 'Armadura',
      ),
      Enchantment(
        id: '21',
        name: 'Fortalecer Arquería',
        effect: 'Arcos causan X% más daño',
        type: 'Armadura',
      ),
      Enchantment(
        id: '22',
        name: 'Fortalecer Armas a Una Mano',
        effect: 'Armas a una mano causan X% más daño',
        type: 'Armadura',
      ),
      Enchantment(
        id: '23',
        name: 'Fortalecer Armas a Dos Manos',
        effect: 'Armas a dos manos causan X% más daño',
        type: 'Armadura',
      ),

      // Armadura - Magia
      Enchantment(
        id: '24',
        name: 'Fortalecer Destrucción',
        effect: 'Hechizos de destrucción cuestan X% menos',
        type: 'Armadura',
      ),
      Enchantment(
        id: '25',
        name: 'Fortalecer Conjuración',
        effect: 'Hechizos de conjuración cuestan X% menos',
        type: 'Armadura',
      ),
      Enchantment(
        id: '26',
        name: 'Fortalecer Restauración',
        effect: 'Hechizos de restauración cuestan X% menos',
        type: 'Armadura',
      ),
      Enchantment(
        id: '27',
        name: 'Fortalecer Alteración',
        effect: 'Hechizos de alteración cuestan X% menos',
        type: 'Armadura',
      ),
      Enchantment(
        id: '28',
        name: 'Fortalecer Ilusión',
        effect: 'Hechizos de ilusión cuestan X% menos',
        type: 'Armadura',
      ),

      // Armadura - Otros
      Enchantment(
        id: '29',
        name: 'Regeneración de Magia',
        effect: 'Regenera magia X% más rápido',
        type: 'Armadura',
      ),
      Enchantment(
        id: '30',
        name: 'Respiración Acuática',
        effect: 'Puedes respirar bajo el agua',
        type: 'Armadura',
      ),
    ];
  }
}
