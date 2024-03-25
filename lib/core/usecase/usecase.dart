import 'package:equatable/equatable.dart';

abstract class UseCase<T, P> {
  Future<T> call({required P params});
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}
