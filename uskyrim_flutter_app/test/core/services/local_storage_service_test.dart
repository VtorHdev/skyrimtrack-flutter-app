import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:uskyrim/core/services/local_storage_service.dart';
import 'package:uskyrim/core/constants/tracked_items.dart';
import 'dart:convert';

void main() {
  late Box<List<String>> mockBox;
  late LocalStorageService service;

  setUp(() async {
    await setUpTestHive();
    mockBox = await Hive.openBox<List<String>>('test_box');
    service = LocalStorageService(mockBox);
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  group('LocalStorageService', () {
    group('getMarkedIds', () {
      test('should return empty list when no data exists', () {
        final result = service.getMarkedIds(TrackedItem.skillBooks);
        expect(result, isEmpty);
      });

      test('should return stored ids correctly', () async {
        // Arrange
        final testIds = ['book1', 'book2', 'book3'];
        await mockBox.put(TrackedItem.skillBooks.key, testIds);

        // Act
        final result = service.getMarkedIds(TrackedItem.skillBooks);

        // Assert
        expect(result, equals(testIds));
      });
    });

    group('toggleMarkedId', () {
      test('should add id when not present', () async {
        // Act
        await service.toggleMarkedId(TrackedItem.enchantments, 'ench1');
        final result = service.getMarkedIds(TrackedItem.enchantments);

        // Assert
        expect(result, contains('ench1'));
      });

      test('should remove id when already present', () async {
        // Arrange
        await mockBox.put(TrackedItem.mainQuests.key, ['quest1']);

        // Act
        await service.toggleMarkedId(TrackedItem.mainQuests, 'quest1');
        final result = service.getMarkedIds(TrackedItem.mainQuests);

        // Assert
        expect(result, isEmpty);
      });
    });

    group('getWordsLearned', () {
      test('should return empty map when no data exists', () {
        final result = service.getWordsLearned(TrackedItem.shouts);
        expect(result, isEmpty);
      });

      test('should return decoded words map correctly', () async {
        // Arrange
        final testMap = {'fus': 2, 'ro': 1};
        await mockBox.put(TrackedItem.shouts.key, [jsonEncode(testMap)]);

        // Act
        final result = service.getWordsLearned(TrackedItem.shouts);

        // Assert
        expect(result, equals(testMap));
      });

      test('should clamp values between 0 and 3', () async {
        // Arrange
        final testMap = {'fus': 5, 'ro': -1};
        await mockBox.put(TrackedItem.shouts.key, [jsonEncode(testMap)]);

        // Act
        final result = service.getWordsLearned(TrackedItem.shouts);

        // Assert
        expect(result['fus'], equals(3));
        expect(result['ro'], equals(0));
      });
    });

    group('toggleWordLearned', () {
      test('should increment word count correctly', () async {
        // Act
        await service.toggleWordLearned(TrackedItem.shouts, 'fus');
        final result = service.getWordsLearned(TrackedItem.shouts);

        // Assert
        expect(result['fus'], equals(1));
      });

      test('should reset to 0 when reaching max count', () async {
        // Arrange
        await mockBox.put(TrackedItem.shouts.key, [
          jsonEncode({'fus': 3})
        ]);

        // Act
        await service.toggleWordLearned(TrackedItem.shouts, 'fus');
        final result = service.getWordsLearned(TrackedItem.shouts);

        // Assert
        expect(result['fus'], equals(0));
      });
    });

    test('clearAll should clear all data', () async {
      // Arrange
      await mockBox.put(TrackedItem.skillBooks.key, ['book1', 'book2']);
      await mockBox.put(TrackedItem.shouts.key, [
        jsonEncode({'fus': 2})
      ]);

      // Act
      await service.clearAll();

      // Assert
      expect(service.getMarkedIds(TrackedItem.skillBooks), isEmpty);
      expect(service.getWordsLearned(TrackedItem.shouts), isEmpty);
    });
  });
}
