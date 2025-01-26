import '/domain/entities/quest.dart';

abstract class DarkBrotherhoodQuestsLocalDatasource {
  List<Quest> getDarkBrotherhoodQuests();
}

class DarkBrotherhoodQuestsLocalDatasourceImpl
    implements DarkBrotherhoodQuestsLocalDatasource {
  @override
  List<Quest> getDarkBrotherhoodQuests() {
    return const [
      // Iniciación
      Quest(
        id: '1',
        name: 'Inocencia Perdida',
        description: 'Mata a Grelod la Bondadosa',
        location: 'Orfanato de Riften',
        prerequisite: 'Ninguno',
      ),
      Quest(
        id: '2',
        name: 'Con Amigos Así...',
        description: 'Escapa de la cabaña abandonada',
        location: 'Cabaña Abandonada',
        prerequisite: 'Inocencia Perdida',
      ),

      // Misiones Principales
      Quest(
        id: '3',
        name: 'Santuario',
        description: 'Únete a la Hermandad Oscura',
        location: 'Santuario de la Hermandad Oscura',
        prerequisite: 'Con Amigos Así...',
      ),
      Quest(
        id: '4',
        name: 'Susurros en la Oscuridad',
        description: 'Habla con la Madre Noche',
        location: 'Santuario de la Hermandad Oscura',
        prerequisite: 'Santuario',
      ),
      Quest(
        id: '5',
        name: 'Silencio Sepulcral',
        description: 'Mata a Cicero o déjalo vivir',
        location: 'Santuario de Dawnstar',
        prerequisite: 'Susurros en la Oscuridad',
      ),
      Quest(
        id: '6',
        name: 'Receta para el Desastre',
        description: 'Infiltrate como el Gourmet y asesina al Emperador',
        location: 'Torre Solitaria',
        prerequisite: 'Silencio Sepulcral',
      ),
      Quest(
        id: '7',
        name: 'Muerte Encarnada',
        description: 'Asesina al verdadero Emperador',
        location: 'Katariah',
        prerequisite: 'Receta para el Desastre',
      ),
      Quest(
        id: '8',
        name: 'Saldar Cuentas',
        description: 'Mata a Amaund Motierre',
        location: 'Posada Errante',
        prerequisite: 'Muerte Encarnada',
      ),

      // Contratos Secundarios
      Quest(
        id: '9',
        name: 'Murmullos de la Muerte',
        description: 'Completa el primer contrato de Nazir',
        location: 'Varios lugares',
        prerequisite: 'Santuario',
      ),
      Quest(
        id: '10',
        name: 'El Silencio ha Sido Roto',
        description: 'Completa el segundo contrato de Nazir',
        location: 'Varios lugares',
        prerequisite: 'Murmullos de la Muerte',
      ),
      Quest(
        id: '11',
        name: 'Contrato: Elimina a Beitild',
        description: 'Asesina a Beitild en Dawnstar',
        location: 'Dawnstar',
        prerequisite: 'Santuario',
      ),
      Quest(
        id: '12',
        name: 'Contrato: Elimina a Narfi',
        description: 'Asesina a Narfi en Ivarstead',
        location: 'Ivarstead',
        prerequisite: 'Santuario',
      ),
      Quest(
        id: '13',
        name: 'Contrato: Elimina a Ennodius Papius',
        description: 'Asesina a Ennodius cerca de Windhelm',
        location: 'Campamento de Ennodius',
        prerequisite: 'Santuario',
      ),

      // Misiones Radiales
      Quest(
        id: '14',
        name: 'Contratos Interminables',
        description: 'Completa contratos para Nazir',
        location: 'Varios lugares',
        prerequisite: 'Muerte Encarnada',
      ),
      Quest(
        id: '15',
        name: 'Honra a la Madre Noche',
        description: 'Escucha a la Madre Noche para obtener contratos bonus',
        location: 'Santuario de Dawnstar',
        prerequisite: 'Muerte Encarnada',
      ),
    ];
  }
}
