import 'package:hotelcardsforsupporthotel/Listing_hotels/domain/repositories/get_hotels_repository.dart';

import '../entities/hotel_entity.dart';

class GetHotelsUseCase{
  final GetHotelsRepository repository;

  const GetHotelsUseCase({required this.repository});
  Future<List<Hotel>> execute() async{
    return repository.getHotelsList();
  }

}