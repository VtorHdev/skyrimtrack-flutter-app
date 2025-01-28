# USkyrim Progress Tracker 🎮

[![Flutter CI](https://github.com/yourusername/uskyrim/actions/workflows/dart.yml/badge.svg)](https://github.com/yourusername/uskyrim/actions/workflows/dart.yml)
[![style: flutter_lints](https://img.shields.io/badge/style-flutter__lints-blue)](https://pub.dev/packages/flutter_lints)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Una aplicación móvil para seguir tu progreso en The Elder Scrolls V: Skyrim.

## 📱 Características

- Seguimiento de libros de habilidad leídos
- Control de encantamientos aprendidos
- Progreso en misiones principales y secundarias
- Seguimiento de casas adquiridas
- Control de palabras de poder (thu'um) aprendidas
- Almacenamiento local persistente
- Interfaz intuitiva con diseño Skyrim-themed

## 🏗️ Arquitectura

La aplicación está construida siguiendo los principios de Clean Architecture, organizando el código en capas independientes y manteniendo una clara separación de responsabilidades:

- **Core**:

  - Contiene la infraestructura base de la aplicación
  - Servicios compartidos como almacenamiento local
  - Constantes y utilidades globales
  - Interfaces base y configuraciones

- **Data**:

  - Implementación concreta de repositorios
  - Modelos de datos y mappers
  - Fuentes de datos (Hive para almacenamiento local)
  - Manejo de errores y excepciones

- **Domain**:

  - Lógica de negocio independiente de la UI
  - Entidades que representan los objetos del juego
  - Casos de uso específicos (marcar items, tracking de progreso)
  - Interfaces de repositorios

- **Presentation**:

  - Implementación de UI con widgets de Flutter
  - Gestión de estado usando BLoC pattern
  - Navegación con Go Router
  - Widgets reutilizables específicos de Skyrim

- **Tests**:

  - Pruebas unitarias para la lógica de negocio
  - Pruebas de integración para la interacción entre capas
  - Pruebas de UI para la capa de presentación

## 🛠️ Tecnologías principales

- **Flutter** 3.19.0
- **Dart** 3.6.0
- **Bloc** para gestión de estado
- **Freezed** para generación de código
- **Equatable** para comparación de objetos
- **Hive** para almacenamiento local
- **Go Router** para navegación
- **Get It** para inyección de dependencias
- **Mockito** para mocking de dependencias

## 📝 Licencia

Este proyecto está licenciado bajo la Licencia GPL-3.0 - ver el archivo [LICENSE](LICENSE) para más detalles.

La Licencia Pública General de GNU v3 (GPL-3.0) es una licencia de software libre y código abierto que garantiza a los usuarios finales la libertad de ejecutar, estudiar, compartir y modificar el software. Cualquier software derivado debe distribuirse bajo los mismos términos.

## 👨‍💻 Desarrollador

- **VtorHdev** - [GitHub](https://github.com/VtorHdev)

## ⚠️ Disclaimer

Este proyecto no está afiliado oficialmente con Bethesda Softworks o The Elder Scrolls V: Skyrim.
