import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String alias;
  final String title;

  const Category({
    required this.alias,
    required this.title,
  });

  @override
  List<Object?> get props => [alias, title];
}
