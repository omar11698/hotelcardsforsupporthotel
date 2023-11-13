import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Listing_hotels/presentation/blocs/get_hotels_bloc.dart';
import 'DI.dart';

class MultiBlocProvidersList {
  static blocProvidersList(BuildContext context) {
    return [
      // BlocProvider<GetWeatherBloc>(
      //   create: (context) => GetWeatherBloc(getWeatherByCityName: instance()),
      //  ),
      BlocProvider(
        create: (context) => GetHotelsBloc(instance())..add(GetHotelsEvents()),
      ),
    ];
  }
}
