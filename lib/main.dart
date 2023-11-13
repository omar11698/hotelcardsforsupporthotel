import 'package:flutter/material.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/domain/entities/hotel_entity.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/presentation/widgets/hotel_card_widget.dart';

import 'core/DI.dart';
import 'core/MultiBlocProvidersList.dart';
import 'core/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/navigation_router.dart';

void main() async{
  await intiAppModule();
  await initGetHotelsModule();
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: MultiBlocProvidersList.blocProvidersList(context),
    child: MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      onGenerateRoute: NavigationRouter.generateRoute,
      initialRoute: hotelCardsRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Hotel hotel = const Hotel(name: "Hotel Fairmont Nile City", starts: 5, price: 100, currency: "USD", image: "https://www.tboholidays.com//imageresource.aspx?img=FbrGPTrju5cc0AnFUdZvcaT421NYlIIKB899kblH89FRaXRjheAxF0mYu56nxq7ybSts6ps0s7BI/8ugu12yto0k2T4b0SzW", reviewScore: 8.8, review: "Excellent", address: "12 miles from the center");
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HotelCardWidget(hotel: hotel),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
