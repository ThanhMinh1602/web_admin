import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_admin/common/constants/define_collection.dart';
import 'package:web_admin/entities/models/payment_model.dart';

class PaymentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PaymentModel>> getPayment() async {
    try {
      final paymentsCollection =
          await _firestore.collection(AppDefineCollection.APP_PAYMENT).get();
      final data = paymentsCollection.docs
          .map((doc) => PaymentModel.fromJson(doc))
          .toList();
      return data;
    } catch (e) {
      throw Exception('Error fetching payments: $e');
    }
  }
}

class SharedPrefs {}
