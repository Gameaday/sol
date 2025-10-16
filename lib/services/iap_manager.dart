import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// Manages in-app purchases for donations and story expansions
class IAPManager extends ChangeNotifier {
  final InAppPurchase _iap = InAppPurchase.instance;
  bool _available = false;
  List<ProductDetails> _products = [];
  
  bool get available => _available;
  List<ProductDetails> get products => List.unmodifiable(_products);
  
  // Product IDs
  static const String donationSmall = 'donation_small';
  static const String donationMedium = 'donation_medium';
  static const String donationLarge = 'donation_large';
  static const String storyExpansion1 = 'story_expansion_1';
  static const String storyExpansion2 = 'story_expansion_2';
  
  Future<void> initialize() async {
    _available = await _iap.isAvailable();
    
    if (_available) {
      const Set<String> productIds = {
        donationSmall,
        donationMedium,
        donationLarge,
        storyExpansion1,
        storyExpansion2,
      };
      
      final ProductDetailsResponse response = 
          await _iap.queryProductDetails(productIds);
      
      if (response.notFoundIDs.isNotEmpty) {
        debugPrint('Products not found: ${response.notFoundIDs}');
      }
      
      _products = response.productDetails;
      notifyListeners();
    }
  }
  
  Future<void> buyProduct(ProductDetails product) async {
    if (!_available) return;
    
    final PurchaseParam purchaseParam = PurchaseParam(
      productDetails: product,
    );
    
    await _iap.buyConsumable(
      purchaseParam: purchaseParam,
      autoConsume: true,
    );
  }
  
  Future<void> restorePurchases() async {
    if (!_available) return;
    await _iap.restorePurchases();
  }
}
