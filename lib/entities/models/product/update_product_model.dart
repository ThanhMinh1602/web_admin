import 'dart:html' as html;

class UpdateProductModel {
  final String? productId;
  final String? cateId;
  final String? productName;
  final double? price;
  final String? description;
  final int minSize;
  final int maxSize;
  final int quantity;
  final html.File? image;

  UpdateProductModel({
    this.productId,
    this.cateId,
    this.productName,
    this.price,
    this.description,
    required this.minSize,
    required this.maxSize,
    required this.quantity,
    this.image,
  });
}
