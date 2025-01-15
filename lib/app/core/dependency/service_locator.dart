import 'package:get_it/get_it.dart';
import 'package:map_box_app/app/features/map_box/data/data_source/map_box_service.dart';
import 'package:map_box_app/app/features/map_box/data/repositories/map_box_impl.dart';
import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/fetch_route.dart';
import 'package:map_box_app/app/features/map_box/presentations/bloc/map_box_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  // service
  sl.registerLazySingleton(() => MapBoxService());
  // repository
  sl.registerLazySingleton<MapBoxRepository>(
      () => MapBoxImpl(mapBoxService: sl()));
  // use case
  sl.registerLazySingleton<FetchRoute>(() => FetchRoute(sl()));
  // bloc
  sl.registerLazySingleton(() => MapBoxBloc(fetchRoute: sl()));
}
