class Product {
  final String name;                     // Name of the product
  final String mainImageUrl;              // Main image for the product
  final List<String> images;              // List of additional images
  final int price;                        // Price of the product
  final List<String> availableColors;     // List of available colors
  final List<String> availableModels;     // List of available models (e.g., sizes)
  final List<String> services;            // List of services (e.g., additional services)
  final String description;               // Description of the product

  Product({
    required this.name,
    required this.mainImageUrl,          // Renamed from 'imageUrl' to 'mainImageUrl' for clarity
    required this.images,                // New field for multiple images
    required this.price,
    required this.availableColors,
    required this.availableModels,
    required this.services,
    required this.description,
  });
}
