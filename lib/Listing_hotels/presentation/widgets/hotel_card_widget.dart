import 'package:flutter/material.dart';
import '../../domain/entities/hotel_entity.dart';

class HotelCardWidget extends StatelessWidget {
  final Hotel hotel;

    const HotelCardWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(children: [
              Image.network(hotel.image,fit: BoxFit.fitWidth,width: double.infinity,height: 150,),
              Positioned(right: 25,top: 25,child:IconButton(onPressed: (){},icon: hotel.isFavourite?const Icon(Icons.favorite,color: Colors.red,):const Icon(Icons.favorite_border,color: Colors.white,size: 35,))),
            ],),
            // Stars
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewStarsRow(hotel: hotel),
                  Text(hotel.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  FittedBox(child: _buildReviewScoreRow()),
                  const SizedBox(height: 5,),
                  ViewDealContainer(hotel: hotel),
                  const MorePrices(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildReviewScoreRow() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(color: Colors.green[900],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(" ${hotel.reviewScore} ".toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),),
                  const SizedBox(width: 10,),
                  Text(hotel.review,style: const TextStyle(color: Colors.black,),),
                  const SizedBox(width: 15,),
                  Icon(Icons.pin_drop_rounded,color: Colors.grey[600],),
                  const SizedBox(width: 15,),
                  Text(hotel.address,style: const TextStyle(color: Colors.black)),
                ],
              );
  }
}

class MorePrices extends StatelessWidget {
  const MorePrices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
      child: Align(child: Text("More Prices",style: TextStyle(decoration: TextDecoration.underline,fontSize: 16,fontWeight: FontWeight.w400),),alignment: Alignment.centerRight,),
    );
  }
}

class ReviewStarsRow extends StatelessWidget {
  const ReviewStarsRow({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < hotel.starts; i++)
          Icon(Icons.star, color: Colors.grey[500]),
        const SizedBox(width: 10,),
        const Text('Hotel', style: TextStyle(fontSize: 16,)),
      ],
    );
  }
}

class ViewDealContainer extends StatelessWidget {
  const ViewDealContainer({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent[100], borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Our lowest price',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                ),
                const SizedBox(height: 3,),
                TextWithDollarSign(hotel: hotel),
                const SizedBox(height: 3,),
                const Text("Renaissance"),

              ],
            ),
            Column(children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('View Deal',style: TextStyle(color: Colors.black,fontSize: 20),),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ),
                ],
              ),
            ],)
          ],
        ),
      ),
    );
  }
}

class TextWithDollarSign extends StatelessWidget {
  const TextWithDollarSign({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const SizedBox(height: 5,),
            Text('\$',style: TextStyle(color: Colors.green[900],fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
        Text('${hotel.price}',style: TextStyle(color: Colors.green[900],fontSize: 24,fontWeight: FontWeight.bold),),
      ],
    );
  }
}