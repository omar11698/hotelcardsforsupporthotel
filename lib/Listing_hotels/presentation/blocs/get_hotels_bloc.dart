import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/presentation/widgets/hotel_card_widget.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/hotel_entity.dart';
import '../../domain/repositories/get_hotels_repository.dart';

part 'get_hotels_event.dart';
part 'get_hotels_state.dart';

class GetHotelsBloc extends Bloc<GetHotelsEvent, GetHotelsState> {
  final GetHotelsRepository getHotelsRepository;
  GetHotelsBloc(this.getHotelsRepository) : super(GetHotelsInitial()) {
    on<GetHotelsEvent>((event, emit) async =>await _handleGetHotelEvent(event,emit));
    on<GetHotelsEvents>((event, emit) async =>await _handleGetHotelEvents(event,emit));
    on<FavouriteButtonTapped>((event, emit) async =>await _handleFavouriteButtonTapped(event,emit));
  }

  _handleGetHotelEvents(GetHotelsEvents event, Emitter<GetHotelsState> emit) async{
    emit(GetHotelsLoading());
    var list= await getHotelsRepository.getHotelsList();
    List<HotelCardWidget> listOfCards=[];
    for( int i=0; i<list.length;i++){
      listOfCards.add(HotelCardWidget( hotel: list[i],));
    }
    emit(GetHotelsSuccess(hotels:listOfCards));
  }

  _handleGetHotelEvent(GetHotelsEvent event, Emitter<GetHotelsState> emit) {}

  _handleFavouriteButtonTapped(FavouriteButtonTapped event, Emitter<GetHotelsState> emit) {

  }
}
