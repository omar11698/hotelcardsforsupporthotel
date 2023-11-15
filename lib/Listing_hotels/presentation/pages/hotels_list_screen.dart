import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/presentation/blocs/isFavCard_bloc/is_favourite_bloc.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/presentation/widgets/hotel_card_widget.dart';
import 'package:hotelcardsforsupporthotel/core/gloabal_variables.dart';
import '../../../core/constants.dart';
import '../blocs/get_hotels_bloc.dart';
import '../widgets/custom_app_bar.dart';

class HotelsListScreen extends StatelessWidget {
  const HotelsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double priceValue = 26;
    var heightOfDevice = MediaQuery.of(context).size.height;
    var widthOfDevice = MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => IsFavouriteBloc(),
  child: Scaffold(
      appBar: CurvedAppBar( actions: [
        ///Filter Button
        Spacer(),
        FiltersButton(
          onTap: () {
            showModalBottomSheet(
                context: context,
                enableDrag: false,
                isScrollControlled: true,
                builder: (context) {
                  List squaresColors=[Colors.red,Colors.orange,Colors.green,Colors.green[700],Colors.green[900],];
                  List squaresRatings=["0",'7+','7.5+','8+','8.5+',];
                  List starsImages=[Constants.oneStarImage,Constants.twoStarImage,Constants.threeStarImage,Constants.fourStarImage,Constants.fiveStarImage,];
                  return FittedBox(
                    child: Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                      height: heightOfDevice>750? heightOfDevice* 0.9:heightOfDevice*0.95,
                      width: widthOfDevice,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        FilterShowModalAppBar(widthOfDevice: widthOfDevice),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Container(
                            height: heightOfDevice>600?heightOfDevice*0.6:300,
                            child: ListView(
                              children: [
                                ///Price Per Night
                                Row(
                                  children: [
                                    Text(
                                      "PRICE PER NIGHT",
                                      style: Constants.appbarTxtStyle
                                          .copyWith(color: Colors.black,letterSpacing: 1),
                                    ),
                                    const Spacer(),
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          borderRadius:
                                              const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '540 + \$',
                                            style: Constants.appbarTxtStyle
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                  ],
                                ),

                                ///Slider
                                StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return Slider(
                                      min: 26,
                                      max: 540,
                                      // divisions: 50,
                                      thumbColor: Colors.white,
                                      label: priceValue.round().toString(),
                                      value: priceValue,
                                      onChanged: (value) {
                                        setState(() {
                                          priceValue = value;
                                        });
                                      },
                                    );
                                  },
                                ),
                                const Row(
                                children: [
                                  Text('26 \$'),
                                  Spacer(),
                                  Text('540 \$'),

                                ],
                              ),
                                const SizedBox(height: 20,),
                                ///Rating
                                Align(alignment: Alignment.centerLeft,child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text('RATING',style:Constants.appbarTxtStyle.copyWith(color: Colors.black,letterSpacing: 1) ,),
                                )),
                                FittedBox(
                                  child: SizedBox(
                                    width: widthOfDevice,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        for(int i=0;i<5;i++)
                                          widthOfDevice>400?Padding(
                                            padding:i==0?EdgeInsets.only(right: widthOfDevice*0.04):EdgeInsets.all(widthOfDevice*0.04),
                                            child: Container(decoration: BoxDecoration(color:squaresColors[i],borderRadius: BorderRadius.circular(5)),
                                              height: 50, width: 50,child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Center(child: Text("${squaresRatings[i]}",style: Constants.appbarTxtStyle.copyWith(color: Colors.white,fontSize: 18),)),),),
                                          ):Padding(
                                            padding:i==0?EdgeInsets.only(right: widthOfDevice*0.025):EdgeInsets.all(widthOfDevice*0.025),
                                            child: Container(decoration: BoxDecoration(color:squaresColors[i],borderRadius: BorderRadius.circular(5)),
                                              height: 50, width: 50,child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Center(child: Text("${squaresRatings[i]}",style: Constants.appbarTxtStyle.copyWith(color: Colors.white,fontSize: 18),)),),),
                                          ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                ///Stars
                                const SizedBox(height: 10,),
                                Align(alignment: Alignment.centerLeft,child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text('HOTEL CLASS',style:Constants.appbarTxtStyle.copyWith(color: Colors.black,letterSpacing: 1) ,),
                                )),
                                FittedBox(
                                  child: Container(
                                    width: widthOfDevice,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        for(int i=0;i<5;i++)
                                          widthOfDevice>400?Padding(
                                            padding: i==0? EdgeInsets.only(right:widthOfDevice*0.04): EdgeInsets.all(widthOfDevice*0.04),
                                            child: Center(child:InkWell(onTap: () {
                                            },child: Image.asset('${starsImages[i]}',fit: BoxFit.cover,width: 50,height: 50,)),),
                                          ):Padding(
                                            padding: i==0? EdgeInsets.only(right:widthOfDevice*0.03): EdgeInsets.all(widthOfDevice*0.03),
                                            child: Center(child:InkWell(onTap: () {
                                            },child: Image.asset('${starsImages[i]}',fit: BoxFit.cover,width: 50,height: 50,)),),
                                          ),
                                        const Spacer(),

                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),

                                /// Distance Form
                                Align(alignment: Alignment.centerLeft,child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text('DISTANCE FORM',style:Constants.appbarTxtStyle.copyWith(color: Colors.black,letterSpacing: 1) ,),
                                )),
                                const Divider(),
                                const SizedBox(height: 10,),
                                /// Location Row
                                Row(children: [ Text("Location",style: Constants.appbarTxtStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w300),),const Spacer(),Row(children: [Text("City Center",style:Constants.appbarTxtStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w300),),const SizedBox(width: 20,),IconButton(icon: const Icon(Icons.arrow_forward_ios_sharp,size: 24,), onPressed: () {  },)],)],),
                                const Divider(),


                              ],
                            ),
                          ),
                        ),
                        /// Bottom Bar with Elevated button of show results
                            const Spacer(),
                            ShowModalBottomBar(widthOfDevice: widthOfDevice,),


                      ]),
                    ),
                  );
                });
          },
        ),
        const Spacer(),
        ///sort button
        SortButton(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  /// lists to fill the widgets
                  List sortByNames=['Our recommendations ','Rating & Recommended ','Price & Recommended','Distance  & Recommended','Rating only','Price only','Distance only',];

                  return Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: heightOfDevice * 0.80,
                    width: widthOfDevice,
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          SortShowModalAppBar(widthOfDevice: widthOfDevice,),
                         for (int i =0; i<7;i++)
                            SortByTile(sortByNames: sortByNames,index: i,),

                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        const Spacer(),
      ]),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<IsFavouriteBloc, IsFavouriteState>(
            builder: (context, state) {
              return BlocBuilder<GetHotelsBloc, GetHotelsState>(
                          builder: (context, state) {
                        if (state is GetHotelsSuccess) {
                          return ListView.builder(
                            itemCount: state.hotels.length,
                            itemBuilder: (context, index) {
                              return HotelCardWidget(hotel: state.hotels[index]);
                            },
                          );
                        }
                        else {
                          return Container();
                        }
                      });
            },
          ),
          ),
        ],
      ),
    ),
);
  }
}

class SortByTile extends StatelessWidget {
  final int index;
  const SortByTile({
    super.key,
    required this.sortByNames, required this.index,
  });

  final List sortByNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(children:[Text('${sortByNames[index]}',style: Constants.appbarTxtStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),const Spacer(),index==0? Icon(Icons.check,color: Colors.blue,):Container()]),
            ),
            const Divider(color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
class FilterShowModalAppBar extends StatelessWidget {
  const FilterShowModalAppBar({
    super.key,
    required this.widthOfDevice,
  });

  final double widthOfDevice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, ),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow:[ BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),],
          borderRadius: const BorderRadius.only(topLeft:Radius.circular(12),topRight: Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                      color: Colors.grey,
                      fontSize: 20),
                )),
            SizedBox(
              width: widthOfDevice * 0.2,
            ),
            Text(
              "Filters",
              style: Constants.appbarTxtStyle.copyWith(color: Colors.black),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 24,
                )),
          ]),
        ),
      ),
    );
  }
}
class SortShowModalAppBar extends StatelessWidget {
  const SortShowModalAppBar({
    super.key,
    required this.widthOfDevice,
  });

  final double widthOfDevice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, ),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow:[ BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),],
          borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [

            SizedBox(
              width: widthOfDevice * 0.4,
            ),
            Text(
              "Sort by",
              style: Constants.appbarTxtStyle.copyWith(color: Colors.black),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 24,
                )),
          ]),
        ),
      ),
    );
  }
}
class ShowModalBottomBar extends StatelessWidget {
  const ShowModalBottomBar({
    super.key,
    required this.widthOfDevice,
  });

  final double widthOfDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfDevice,
      decoration:   const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),

      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                child: InkWell(
                  onTap: () {  },
                  child: Container(
                    height: 50,
                    width: widthOfDevice *0.75,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Show results",
                        style: Constants.appbarTxtStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SortButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SortButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            CupertinoIcons.sort_down,
            color: Colors.blue[700],
            size: 28,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Sort",
            style: Constants.appbarTxtStyle.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue),
          ),
        ],
      ),
    );
  }
}
class FiltersButton extends StatelessWidget {
  final VoidCallback? onTap;
  const FiltersButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                Constants.filterImage,
                color: Colors.blue[700],
              )),
          const SizedBox(
            width: 20,
          ),
          Text("Filters", style: Constants.appbarTxtStyle),
        ],
      ),
    );
  }
}
