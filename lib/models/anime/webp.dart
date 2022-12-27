import 'package:equatable/equatable.dart';

class Webp extends Equatable {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const Webp({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        imageUrl: json['image_url'] as String?,
        smallImageUrl: json['small_image_url'] as String?,
        largeImageUrl: json['large_image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
        'small_image_url': smallImageUrl,
        'large_image_url': largeImageUrl,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [imageUrl, smallImageUrl, largeImageUrl];
}
