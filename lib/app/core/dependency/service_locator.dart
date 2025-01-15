import 'package:get_it/get_it.dart';
import 'package:map_box_app/app/core/mapper/coordinate_mapper.dart';
import 'package:map_box_app/app/core/mapper/suggest_mapper.dart';
import 'package:map_box_app/app/features/map_box/data/data_source/map_box_service.dart';
import 'package:map_box_app/app/features/map_box/data/repositories/map_box_impl.dart';
import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/fetch_route.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/search_suggestion.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/suggestion_on_tap.dart';
import 'package:map_box_app/app/features/map_box/presentations/bloc/map_box_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  // service
  sl.registerLazySingleton(() => MapBoxService());
  // mapper
  sl.registerLazySingleton(() => SuggestMapper());
  sl.registerLazySingleton(() => CoordinateMapper());
  // repository
  sl.registerLazySingleton<MapBoxRepository>(() => MapBoxImpl(
      mapBoxService: sl(), suggestMapper: sl(), coordinateMapper: sl()));
  // use case
  sl.registerLazySingleton<FetchRoute>(() => FetchRoute(sl()));
  sl.registerLazySingleton<SearchSuggestion>(() => SearchSuggestion(sl()));
  sl.registerLazySingleton<SuggestionOnTap>(() => SuggestionOnTap(sl()));
  // bloc
  sl.registerLazySingleton(() => MapBoxBloc(
      fetchRoute: sl(), searchSuggestion: sl(), suggestionOnTap: sl()));
}
