import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  String getFrom(String key);
  Future<bool> setTo(String key, value);
  Future<void> delete(String key);
  Future<void> clear();
  bool itHas(String key);
}

@LazySingleton(as: Storage)
class StorageImpl extends Storage {
  StorageImpl({
    required this.preferences,
  });

  final SharedPreferences preferences;

  @override
  Future<void> clear() async {
    await preferences.clear();
  }

  @override
  Future<void> delete(String key) async {
    await preferences.remove(key);
  }

  @override
  String getFrom(String key) {
    return preferences.getString(key) ?? '';
  }

  @override
  bool itHas(String key) {
    return preferences.containsKey(key);
  }

  @override
  Future<bool> setTo(String key, value) async {
    return await preferences.setString(key, value);
  }
}
