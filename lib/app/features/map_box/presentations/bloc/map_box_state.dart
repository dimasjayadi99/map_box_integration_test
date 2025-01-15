part of 'map_box_bloc.dart';

abstract class MapBoxState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapBoxInitState extends MapBoxState {}

class SearchLoadingState extends MapBoxState {}

class SearchSuccessState extends MapBoxState {
  final List<SuggestionEntity> suggestion;

  SearchSuccessState(this.suggestion);

  @override
  List<Object?> get props => [suggestion];
}

class SearchFailedState extends MapBoxState {
  final String message;

  SearchFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
