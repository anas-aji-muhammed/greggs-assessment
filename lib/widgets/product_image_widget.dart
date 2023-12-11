import 'package:flutter/material.dart';

class ProductImageWidget extends StatefulWidget {
  final String imageUrl;
  final double width;
  const ProductImageWidget({super.key,
    required this.imageUrl, this.width=0.9});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image(
        image: NetworkImage(widget.imageUrl),
      errorBuilder: (context, exception, stackTrace) {
        return const FlutterLogo(); // Display a placeholder in case of an error
      },
      fit: BoxFit.contain,
      width: MediaQuery.of(context).size.width * widget.width,
    );

  }
}
