import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoriteIteam extends StatelessWidget {
  const FavoriteIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Mytheme.mainColor),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/baner1.png',
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Nike air jordan',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            size: 23,
                            color: Mytheme.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP 1300',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Mytheme.mainColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Add to Cart',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
