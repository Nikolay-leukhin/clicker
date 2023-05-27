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
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.yellow
        ),
        child: ListTile(
          title: Text(widget.model.boostName, style: Theme.of(context).textTheme.bodyMedium,),
          trailing: Text("+${(widget.model.iqValue + widget.model.respectValue) / 2}", style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
      openBuilder: (context, act) => ShopItemDescription(item: widget),
    );
  }
}


class ShopItemSchema{
  final String boostName;
  final int iqValue;
  final int respectValue;
  final String description;
  final int iqPrice;
  final int respectPrice;


  ShopItemSchema({required this.boostName, required this.iqValue, required this.respectValue, required this.description, required this.iqPrice, required this.respectPrice});
}


List<ShopItemSchema> shopItemCardList = [
  ShopItemSchema(
      boostName: "мегабаф",
      iqValue: 10,
      respectValue: 5,
      description: "нереальное присполообление",
      iqPrice: 200,
      respectPrice: 150
  ),
  ShopItemSchema(
      boostName: "среднячок",
      iqValue: 10,
      respectValue: 5,
      description: "нереальное присполообление",
      iqPrice: 200,
      respectPrice: 1500
  ),
  ShopItemSchema(
      boostName: "бомбическая тема",
      iqValue: 10,
      respectValue: 5,
      description: "нереальное присполообление",
      iqPrice: 200,
      respectPrice: 1500
  ),
  ShopItemSchema(
      boostName: "дебаф",
      iqValue: 10,
      respectValue: 5,
      description: "нереальное присполообление",
      iqPrice: 200,
      respectPrice: 1500
  ),
  ShopItemSchema(
      boostName: "фигня",
      iqValue: 10,
      respectValue: 5,
      description: "нереальное присполообление",
      iqPrice: 200,
      respectPrice: 1500
  ),
];


