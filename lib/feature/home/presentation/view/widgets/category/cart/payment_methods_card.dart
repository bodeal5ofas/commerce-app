import 'package:ecommerce_app/core/utils/api_keys.dart';
import 'package:ecommerce_app/core/utils/custom_show_snack_bar.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/core/utils/stripe_service.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/product_data/product_data.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_paypal/amount_model/amount_model.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_paypal/amount_model/details.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_paypal/order_list_model/item.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_paypal/order_list_model/order_list_model.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_stripe/payment_input_model.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/cart/payment_method.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaymentMethodsCard extends StatefulWidget {
  const PaymentMethodsCard({super.key, required this.price});
  final num price;

  @override
  State<PaymentMethodsCard> createState() => _PaymentMethodsCardState();
}

class _PaymentMethodsCardState extends State<PaymentMethodsCard> {
  List<String> images = [
    'assets/images/card.svg',
    'assets/images/paybal_logo.svg'
  ];
  int currentIndex = 0;
  //bool isPayPal = false;
  late List<ProductData> products;
  @override
  void initState() {
    products = BlocProvider.of<CartCubit>(context).products;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            2,
            (index) => GestureDetector(
                onTap: () {
                  currentIndex = index;
                  //    isPayPal = currentIndex == 0 ? false : true;
                  setState(() {});
                },
                child: PaymentMethod(
                  isActive: currentIndex == index,
                  image: images[index],
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Mytheme.mainColor,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () async {
            var transaction = getTransaction();
            //isPayPal == true
            currentIndex == 1
                ? 
                    payPalPayment(
                      amountModel: transaction.amount,
                      orders: OrderListModel(items: transaction.orders),
                    )
                  
                : await crediteMethod(context);
          },
          child: Text(
            "Payment",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Future<void> crediteMethod(BuildContext context) async {
    String customerId = SharedPrefrenceUtils.get(key: 'id') as String;
    try {
      await StripeService().makePayment(
          paymentInputModel: PaymentInputModel(
              ccurency: "USD",
              customerId: customerId,
              amount: (widget.price * 100)));
      customShowSnackBar(context: context, message: 'Succesfully payment');
    } catch (e) {
      customShowSnackBar(context: context, message: 'Failed payment');
    }
  }

  ({AmountModel amount, List<OrderModel> orders}) getTransaction() {
    AmountModel amount = AmountModel(
      currency: "USD",
      total: widget.price.toString(),
      details: Details(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: widget.price.toString(),
      ),
    );

    List<OrderModel> orders = List.generate(
        products.length,
        (index) => OrderModel(
              currency: "USD",
              name: products[index].productData!.title,
              price: products[index].price.toString(),
              quantity: products[index].count,
            ));
    return (amount: amount, orders: orders);
  }

  payPalPayment(
      {required AmountModel amountModel, required OrderListModel orders}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": orders.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          customShowSnackBar(context: context, message: 'Sucessfull Payment');
          print("onSuccess: $params");
        },
        onError: (error) {
          customShowSnackBar(context: context, message: 'Payment Failed');
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
