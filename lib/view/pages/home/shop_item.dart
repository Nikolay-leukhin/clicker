import 'package:clicker/view/pages/home/shop_item_description.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../../utils/colors.dart';

class ShopItemCard extends StatefulWidget {
  final ShopItemSchema model;
  const ShopItemCard({Key? key, required this.model}) : super(key: key);

  @override
  State<ShopItemCard> createState() => _ShopItemCardState();
}

class _ShopItemCardState extends State<ShopItemCard> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 450),
      closedBuilder: (context, act) => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: AppColors.yellow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Wrap(
                children: [Text(
                  widget.model.boostName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),]
              ),
            ),
            SizedBox(
                width: 50,
                child: FittedBox(child: Text("+${(widget.model.iqValue + widget.model.respectValue) / 2}",textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyMedium))),
          ],
        ),
      ),
      openBuilder: (context, act) => ShopItemDescription(item: widget),
    );
  }
}

class ShopItemSchema {
  final String boostName;
  final int iqValue;
  final int respectValue;
  final String description;
  final int iqPrice;
  final int respectPrice;

  ShopItemSchema(
      {required this.boostName,
      required this.iqValue,
      required this.respectValue,
      required this.description,
      required this.iqPrice,
      required this.respectPrice});
}

List<ShopItemSchema> shopItemCardList = [
  ShopItemSchema(
      boostName: "стартер",
      iqValue: 2,
      respectValue: 2,
      description: "вполне неплохо для старта советую использовать",
      iqPrice: 200,
      respectPrice: 150),
  ShopItemSchema(
      boostName: "шаражный взрыв", iqValue: 40, respectValue: 0, description: "идеально если вы хотите стать профессором", iqPrice: 400, respectPrice: 6000),
  ShopItemSchema(
      boostName: "помыть доску", iqValue: 0, respectValue: 10, description: "прокачивает респект хорошая штука в целом", iqPrice: 200, respectPrice: 150),
  ShopItemSchema(
      boostName: "универсалочка", iqValue: 15, respectValue: 15, description: "для плотного кача в пуджа этого мира", iqPrice: 1000, respectPrice: 1200),
  ShopItemSchema(
      boostName: "успешный пак", iqValue: 0, respectValue: 1000, description: "эта штука сделает тебя реально успешным", iqPrice: 15000, respectPrice: 20000),
];
