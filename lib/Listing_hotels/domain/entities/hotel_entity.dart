import 'package:equatable/equatable.dart';

class Hotel extends Equatable {

  final String name;
  final int starts;
  final int price;
  final String currency;
  final String image;
  final double reviewScore;
  final String review;
  final String address;
  final bool isFavourite;

  const Hotel({required this.name,
      required this.starts,
      required this.price,
      required this.currency,
      required this.image,
      required this.reviewScore,
      required this.review,
      required this.address,
      this.isFavourite= false,
  });

  @override
  List<Object?> get props => [
        name,
        starts, price, currency,
        image, reviewScore, review, address,isFavourite
      ];
}
