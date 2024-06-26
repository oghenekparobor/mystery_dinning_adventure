import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: '.env',
  obfuscate: true,
)
abstract class Env {
  @EnviedField(varName: 'BaseUrl')
  static String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'Key')
  static String key = _Env.key;
}
