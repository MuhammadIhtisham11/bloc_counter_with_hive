import 'package:hive_flutter/adapters.dart';

class CounterStoreData {
  static late Box _box;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("CounterData");
  }

  static Future<void> saveData(int value) async {
    _box.put("counter_value", value);
  }

  static int getData() {
    return _box.get("counter_value") ?? 0;
  }
}
