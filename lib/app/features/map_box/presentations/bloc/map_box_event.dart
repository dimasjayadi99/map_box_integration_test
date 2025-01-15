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

class OnSuggestionSearch extends MapBoxEvent {
  final String query;

  OnSuggestionSearch(this.query);

  @override
  List<Object?> get props => [query];
}

class OnClearSuggestion extends MapBoxEvent {}
