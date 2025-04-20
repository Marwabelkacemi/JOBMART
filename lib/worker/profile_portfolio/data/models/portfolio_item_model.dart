import '../../domain/entities/portfolio_item.dart';

class PortfolioItemModel extends PortfolioItem {
  const PortfolioItemModel({
    required super.id,
    required super.title,
    required super.description,
    required super.mediaUrl,
  });

  /// Create a [PortfolioItemModel] from a map.
  factory PortfolioItemModel.fromMap(Map<String, dynamic> map) {
    return PortfolioItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      mediaUrl: map['mediaUrl'] as String,
    );
  }

  /// Convert the portfolio item into a map to store in Firestore.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'mediaUrl': mediaUrl,
    };
  }
}
