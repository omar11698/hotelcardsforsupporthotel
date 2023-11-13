import 'package:hotelcardsforsupporthotel/Listing_hotels/data/local/models/hotel_model.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/domain/entities/hotel_entity.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/domain/repositories/get_hotels_repository.dart';

import '../local/data_sources/dummy_data.dart';

class GetHotelsRepoImpl extends GetHotelsRepository{
  final HotelModel hotelModel=HotelModel(name: "name", starts: 5, price: 12, currency: "currency", image: "image", reviewScore: 12, review: "review", address: "address");

  @override
  List<Hotel> getHotelsList() {
   return hotelModel.getHotelListFromDummy(hotelListOfMapsFromDummy);
  }



}