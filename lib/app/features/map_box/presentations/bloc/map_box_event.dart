part of 'map_box_bloc.dart';

abstract class MapBoxEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnTapMap extends MapBoxEvent {
  final MapContentGestureContext context;

  OnTapMap(this.context);

  @override
  List<Object?> get props => [context];
}
