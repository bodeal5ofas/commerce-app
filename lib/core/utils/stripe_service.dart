import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_keys.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/customer_model/customer_model.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_stripe/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_stripe/payment_input_model.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_stripe/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final Dio dio = Dio();
  Future<CustomerModel> createCustomer({required String name}) async {
    Response response = await dio.post(
      'https://api.stripe.com/v1/customers',
      data: {'name': name},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
        },
      ),
    );
    return CustomerModel.fromJson(response.data);
  }

  Future<PaymentIntentModel> createPayentIntent(
      {required num amount,
      required String currency,
      required String customerId}) async {
    Response response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: {'amount': amount, 'currency': currency, 'customer': customerId},
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
        }));
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    Response response = await dio.post(
        'https://api.stripe.com/v1/ephemeral_keys',
        data: {'customer': customerId},
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          "Stripe-Version": " 2025-01-27.acacia"
        }));
    return EphemeralKeyModel.fromJson(response.data);
  }

  Future initPaymentInten(
      {required String clientSecret,
      required String epheralKeySecret,
      required String customerId}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Ecommerce Store',
      paymentIntentClientSecret: clientSecret,
      // Customer keys
      customerEphemeralKeySecret: epheralKeySecret,
      customerId: customerId,
    ));
  }

  Future presentPaymentIntent() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentInputModel paymentInputModel}) async {
    var paymentIntentModel = await createPayentIntent(
        amount: paymentInputModel.amount,
        currency: paymentInputModel.ccurency,
        customerId: paymentInputModel.customerId);
    var ephemerialKeyModel =
        await createEphemeralKey(customerId: paymentInputModel.customerId);
    await initPaymentInten(
        clientSecret: paymentIntentModel.clientSecret!,
        epheralKeySecret: ephemerialKeyModel.secret!,
        customerId: paymentInputModel.customerId);
    await presentPaymentIntent();
  }
}
