part of 'get_hotels_bloc.dart';

@immutable
abstract class GetHotelsState {}

class GetHotelsInitial extends GetHotelsState {}
class GetHotelsLoading extends GetHotelsState {}
class GetHotelsSuccess extends GetHotelsState {
  final List <HotelCardWidget>hotels;

  GetHotelsSuccess({required this.hotels});
}
class GetHotelsFailure extends GetHotelsState {}
