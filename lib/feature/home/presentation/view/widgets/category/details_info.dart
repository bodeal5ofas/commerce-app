import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/details_description.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/details_price_info.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/details_title.dart';
import 'package:flutter/material.dart';
//import 'package:readmore/readmore.dart';

class DetailsInfo extends StatefulWidget {
  const DetailsInfo({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<DetailsInfo> createState() => _DetailsInfoState();
}

class _DetailsInfoState extends State<DetailsInfo> {
  int count = 1;
  num? price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailtsTitle(productModel: widget.productModel),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Mytheme.mainColor)),
              child: Text(
                '${widget.productModel.sold} Sold',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              '${widget.productModel.ratingsAverage}(${widget.productModel.ratingsQuantity})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Mytheme.mainColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        count--;
                        price = count * widget.productModel.price!;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      )),
                  Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                      onPressed: () {
                        count++;
                        price = count * widget.productModel.price!;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_sharp,
                        color: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        DetailsDescription(
          productModel: widget.productModel,
        ),
        const SizedBox(
          height: 20,
        ),
        DetailsPriceInfo(
          price: price ?? widget.productModel.price!,
        )
      ],
    );
  }
}
