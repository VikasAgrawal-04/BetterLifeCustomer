import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  final Box _box;
  HiveStorage({required Box box}) : _box = box;

  Future<void> put(String key, dynamic value) async {
    try {
      final containsKey = _box.keys.contains(key);
      if (containsKey) {
        final index = _box.keys.toList().indexOf(key);
        await _box.putAt(index, value);
      } else {
        await _box.put(key, value);
      }
    } catch (e) {
      rethrow;
    }
  }

  bool containsKey(String key) {
    return _box.keys.contains(key);
  }

  int findIndex(String key) {
    final containsKey = _box.keys.contains(key);
    if (containsKey) {
      final currentKey = _box.keys.firstWhere((element) => element == key);
      return int.parse(currentKey);
    }
    return -1;
  }

  Future<void> deleteWhere(bool Function(dynamic) condition) async {
    final values = _box.keys.where(condition);
    for (var element in values) {
      await delete(element);
    }
  }

  // watch
  Stream<BoxEvent> watch({String? key}) {
    return _box.watch(key: key);
  }

  dynamic get(String key) {
    return _traverseRead(_box.get(key));
  }

  dynamic getAt(int index) {
    return _traverseRead(_box.getAt(index));
  }

  Future<void> delete(String key) async {
    try {
      await _box.delete(key);
    } catch (e) {
      rethrow;
    }
  }

  // delete all
  Future<void> deleteAll() async {
    await _box.clear();
  }

  //put at
  Future<void> putAt(int index, dynamic value) async {
    await _box.putAt(index, value);
  }

  // Future<void> put(int index, dynamic value) async {
  //   await _box.putAt(index, value);
  // }

  // delete at
  Future<void> deleteAt(int index) async {
    await _box.deleteAt(index);
  }

  // values
  List<dynamic> get values {
    return _traverseRead(_box.values.toList());
  }

  T? _cast<T>(dynamic x) => x is T ? x : null;

  dynamic _traverseRead(dynamic value) {
    if (value is Map) {
      return value.map<String, dynamic>((dynamic key, dynamic value) {
        return MapEntry<String, dynamic>(
          _cast<String>(key) ?? '',
          _traverseRead(value),
        );
      });
    }
    if (value is List) {
      for (var i = 0; i < value.length; i++) {
        value[i] = _traverseRead(value[i]);
      }
    }
    return value;
  }

  // keys
  List<dynamic> get keys => _box.keys.toList();
}
