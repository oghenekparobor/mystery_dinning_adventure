import 'package:mystery_dinning_adventure/core/__network_export.dart';

extension AppStateExtension on AppState {
  bool get isError => (this is ErrorState);
}
