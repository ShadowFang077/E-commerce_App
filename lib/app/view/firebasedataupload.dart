import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addOrUpdateCarouselImages({
  required String productId,
  required List<String> imgList,
}) async {
  final productRef = FirebaseFirestore.instance.collection('Products').doc(productId);

  try {
    final doc = await productRef.get();

    if (doc.exists) {
      // Document exists → update carouselSliderImages
      await productRef.update({
        'carouselSliderImages': imgList,
      });
      print('Carousel images updated successfully!');
    } else {
      // Document doesn't exist → create new with carouselSliderImages
      await productRef.set({
        'carouselSliderImages': imgList,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('New product with carousel images created!');
    }
  } catch (e) {
    print('Error adding/updating carousel images: $e');
  }
}


Future<List<String>> getCarouselImages(String productId) async {
  final productRef = FirebaseFirestore.instance.collection('Products').doc(productId);

  try {
    final doc = await productRef.get();

    if (doc.exists) {
      final data = doc.data();
      if (data != null && data['carouselSliderImages'] != null) {
        return List<String>.from(data['carouselSliderImages']);
      }
    }
  } catch (e) {
    print('Error fetching carousel images: $e');
  }

  return [];
}


Future<void> addOrUpdateProductData({
  required String productIds,
  required List<Map<String, dynamic>> trendingJsonDatas, // change type
}) async {
  final productsData = FirebaseFirestore.instance.collection('Products data').doc(productIds);

  try {
    final doc = await productsData.get();

    if (doc.exists) {
      await productsData.update({
        'trendingProduct': trendingJsonDatas,
      });
      print('Product updated successfully!');
    } else {
      await productsData.set({
        'trendingProduct': trendingJsonDatas,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('New product with images created!');
    }
  } catch (e) {
    print('Error adding/updating product images: $e');
  }
}


Future<List<Map<String, dynamic>>> getProductData(String productIds) async {
  final productsData = FirebaseFirestore.instance.collection('Products data').doc(productIds);

  try {
    final doc = await productsData.get();

    if (doc.exists) {
      final data = doc.data();
      if (data != null && data['trendingProduct'] != null) {
        return List<Map<String, dynamic>>.from(data['trendingProduct']);
      }
    }
  } catch (e) {
    print('Error fetching carousel images: $e');
  }
  return []; // fallback in case of error or no data
}


