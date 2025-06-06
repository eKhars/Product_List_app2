import 'package:flutter/material.dart';
import '../../data/models/product.dart';
import '../../core/util.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID: ${product.id}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              
              if (product.category != null)
                Chip(
                  label: Text(
                    product.category!,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
              SizedBox(height: 16),
              
              if (product.imageUrl != null)
                Center(
                  child: Image.network(
                    product.imageUrl!,
                    height: 200,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported, size: 100);
                    },
                  ),
                ),
              SizedBox(height: 24),
              
              Text(
                product.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              
              Text(
                'Precio: \$${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 16),
              
              if (product.rating != null)
                Row(
                  children: [
                    Text(
                      'Rating: ${product.rating!.toStringAsFixed(1)}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < product.rating!.floor()
                              ? Icons.star
                              : (index < product.rating! 
                                  ? Icons.star_half
                                  : Icons.star_border),
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '(${product.ratingCount})',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              SizedBox(height: 24),
              
              Text(
                'Descripción:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Cart.add(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.title} agregado al carrito')),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Agregar al carrito'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}