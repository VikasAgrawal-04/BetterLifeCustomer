import 'package:hive_storage/hive_storage.dart';
import 'package:rxdart/subjects.dart';

import '../models/user.dart';

class _Keys {
  static const String user = 'user';
  static const String token = 'token';
  static const String isLoggedIn = 'isLoggedIn';
}

abstract class AuthStorage {
  User? getUser();
  Future<void> setUser(Map<String, dynamic> user);
  Future<void> removeUser();
  Future<void> removeToken();
  Future<void> setIsLoggedIn(bool value);

  Future<void> setToken(String token);
  String? getToken();

  bool get isLoggedIn;

  Stream<User?> get userStream;
}

class StorageService implements AuthStorage {
  StorageService({
    required Box box,
  }) : storage = HiveStorage(box: box) {
    getUser();
    _listenForChanges();
  }

  final HiveStorage storage;

  // late final BehaviorSubject<User?> _controller;
  final _controller = BehaviorSubject<User?>.seeded(null);

  String get userKey => _Keys.user;

  @override
  User? getUser() {
    final map = storage.get(_Keys.user);
    if (map == null) return null;
    final user = User.fromJson(Map<String, dynamic>.from(map));
    _controller.add(user);
    return user;
  }

  @override
  Future<void> removeUser() async {
    await storage.delete(_Keys.user);
  }

  @override
  Future<void> setUser(Map<String, dynamic> user) async {
    await storage.put(_Keys.user, user);
  }

  @override
  Future<void> setToken(String token) async {
    await storage.put(_Keys.token, token);
  }

  @override
  String? getToken() {
    return storage.get(_Keys.token);
  }

  @override
  Future<void> removeToken() async {
    await storage.delete(_Keys.token);
  }

  void _listenForChanges() {
    storage.watch(key: _Keys.user).map((event) {
      if (event.value == null) return null;
      return User.fromJson(Map<String, dynamic>.from(event.value));
    }).listen((event) => _controller.add(event));
  }

  @override
  Stream<User?> get userStream => _controller.stream;

  @override
  bool get isLoggedIn => storage.get(_Keys.isLoggedIn) ?? false;

  @override
  Future<void> setIsLoggedIn(bool value) async {
    await storage.put(_Keys.isLoggedIn, value);
  }

  Stream<String?> get tokenStream => storage.watch(key: _Keys.token).map(
        (event) {
          if (event.value == null) return null;
          return event.value as String;
        },
      );
}
