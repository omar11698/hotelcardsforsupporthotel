import 'package:get_it/get_it.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/data/local/models/hotel_model.dart';

import '../Listing_hotels/data/repositories/get_hotels_repoImpl.dart';
import '../Listing_hotels/domain/repositories/get_hotels_repository.dart';
import '../Listing_hotels/domain/use_cases/get_hotels_usecase.dart';
import '../Listing_hotels/presentation/blocs/get_hotels_bloc.dart';

final instance = GetIt.instance;
Future<void> intiAppModule()async {
//
// // remote data source
//   instance.registerLazySingleton<RemoteDataSource>(
//           () =>RemoteDataSourceImpl());

  instance.registerLazySingleton<GetHotelsRepository>(() => GetHotelsRepoImpl());
}
// /// for use case
  initGetHotelsModule() {
    if (!GetIt.I.isRegistered<GetHotelsUseCase>()) {
      instance
          .registerFactory<GetHotelsUseCase>(() =>
          GetHotelsUseCase(repository: instance()));
      instance
          .registerFactory<GetHotelsBloc>(() => GetHotelsBloc(instance()));
    }
  }

