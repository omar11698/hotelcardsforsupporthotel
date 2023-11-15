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
  final int index;

  const Hotel({required this.name,
      required this.starts,
      required this.price,
      required this.currency,
      required this.image,
      required this.reviewScore,
      required this.review,
      required this.address,
      required this.isFavourite,
      required this.index,
  });

  Hotel copyWith({
    String? name,
    int? starts,
    int? price,
    String? currency,
    String? image,
    double? reviewScore,
    String? review,
    String? address,
    bool? isFavourite,
    int? index,
  }) {
    return Hotel(
      name: name ?? this.name,
      starts: starts ?? this.starts,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      image: image ?? this.image,
      reviewScore: reviewScore ?? this.reviewScore,
      review: review ?? this.review,
      address: address ?? this.address,
      isFavourite: isFavourite ?? this.isFavourite, index: index??this.index,
    );
  }

  @override
  List<Object?> get props => [
        name,
        starts, price, currency,
        image, reviewScore, review, address,isFavourite
      ];


}
