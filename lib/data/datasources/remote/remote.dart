import 'package:injectable/injectable.dart';

abstract class RemoteDS {}

@LazySingleton(as: RemoteDS)
class RemoteDSImpl extends RemoteDS {}
