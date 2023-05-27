import 'package:clicker/view/pages/home/shop_item.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SHOP"),),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backblue.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.separated(
          itemCount: shopItemCardList.length,
          itemBuilder: (context, index) {
            var item = shopItemCardList[index];
            return ShopItemCard(model: item);
          },
          separatorBuilder: (context, index) => SizedBox(height: 15,),

        ),
      ),
    );
  }
}


