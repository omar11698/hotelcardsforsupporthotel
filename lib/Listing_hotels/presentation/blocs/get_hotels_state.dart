part of 'get_hotels_bloc.dart';

@immutable
abstract class GetHotelsState {}

class GetHotelsInitial extends GetHotelsState {}
class GetHotelsLoading extends GetHotelsState {}
class GetHotelsSuccess extends GetHotelsState {
  final List hotels;
  final List favList;
   GetHotelsSuccess( {required this.hotels, required this.favList,});
}
class GetHotelsFailure extends GetHotelsState {}
