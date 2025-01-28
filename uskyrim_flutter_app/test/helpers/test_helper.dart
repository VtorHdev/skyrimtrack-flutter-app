import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initHiveForTesting() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final tempDir = await getTemporaryDirectory();
  Hive.init(tempDir.path);
}
