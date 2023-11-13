import 'package:hotelcardsforsupporthotel/Listing_hotels/domain/entities/hotel_entity.dart';

class HotelModel extends Hotel {
  final String name;
  final int starts;
  final int price;
  final String currency;
  final String image;
  final double reviewScore;
  final String review;
  final String address;

  const HotelModel(
      {required this.name,
      required this.starts,
      required this.price,
      required this.currency,
      required this.image,
      required this.reviewScore,
      required this.review,
      required this.address}) : super(name: '', starts: 0, price: 0, currency: '', image: '', reviewScore: 0, review: '', address: '') ;


  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
        name: json["name"],
        starts: json["starts"]??0,
        price: json['price']??0 ,
        currency: json["currency"],
        image: json["image"],
        reviewScore: json["review_score"].toDouble(),
        review: json["review"],
        address: json["address"]);
  }

  List<HotelModel> getHotelListFromDummy(List<Map<String,dynamic>>hotelsListOfMaps){
    return hotelsListOfMaps.map((e) => HotelModel.fromJson(e)).toList();
  }
}
