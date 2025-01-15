part of 'map_box_bloc.dart';

abstract class MapBoxState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapBoxInitState extends MapBoxState {}

class MapBoxLoadingState extends MapBoxState {}

class MapBoxSuccessState extends MapBoxState {
  final List<Position> positions;

  MapBoxSuccessState(this.positions);

  @override
  List<Object?> get props => [positions];
}

class MapBoxFailedState extends MapBoxState {
  final String message;

  MapBoxFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
