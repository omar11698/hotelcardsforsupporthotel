import '../entities/hotel_entity.dart';

abstract class GetHotelsRepository{
  List<Hotel>getHotelsList();
}