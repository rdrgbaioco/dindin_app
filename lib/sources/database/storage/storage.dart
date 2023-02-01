import 'package:dindin_app/library.dart';

class Storage implements StorageService {
  final HiveInterface hive = Hive;
  static const String _box = 'resources';
  static const String _token = 'token';


  Future<Box> _openBox<T>({required String box}) async {
    try {
      if (hive.isBoxOpen(box)) {

        return hive.box<T>(box);
      } else {
        return await hive.openBox<T>(box, crashRecovery: true);
      }
    } on Error {
      throw Error();
    }
  }

  @override
  FutureOr<VerifyKey> containsToken() async {
    final box = await _openBox(box: _box);
    final contains = box.containsKey(_token);
    if (contains) {
      final value = await box.get(_token);
      if (value == null) {
        return VerifyKey.noValue;
      } else {
        return VerifyKey.contains;
      }
    } else {
      return VerifyKey.noKey;
    }
  }

  @override
  FutureOr<Token> getToken() async {
    try {
      final box = await _openBox(box: _box);
      final Token result = await box.get(_token);
      return result;
    } on Error {
      throw Error();
    }
  }

  @override
  FutureOr<void> save({required Token token}) async {
    final box = await _openBox(box: _box);
    await box.put(_token, token);
    await box.compact();
  }


  @override
  FutureOr<void> clear() async {
    Box resources = await _openBox(box: _box);
    await resources.clear();
    await Hive.deleteFromDisk();
  }
}