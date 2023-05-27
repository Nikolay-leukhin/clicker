import 'package:clicker/main.dart';
import 'package:clicker/view/pages/home/shop_item.dart';
import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/buy/buy_bloc.dart';

class ShopItemDescription extends StatefulWidget {
  final ShopItemCard item;
  const ShopItemDescription({Key? key, required this.item}) : super(key: key);

  @override
  State<ShopItemDescription> createState() => _ShopItemDescriptionState();
}

class _ShopItemDescriptionState extends State<ShopItemDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("УСИЛЕНИЕ"),
      ),
      body: BlocConsumer<BuyBloc, BuyState>(
        bloc: context.read<BuyBloc>(),
        listener: (context, state) {
          if (state is BuySuccess){
            final SnackBar snack = SnackBar(content: Text("успешная покупка"));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }else if (state is BuyFailed){
            final SnackBar snack = SnackBar(content: Text("деньжат не хватает"));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backpurple.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShopItemDescriptionAttribute(
                      width: MediaQuery.of(context).size.width * 0.45,
                      title: "IQ",
                      subtitle: widget.item.model.iqValue.toString(),
                      color: AppColors.blue,
                      icon: Icons.ads_click_rounded,
                    ),
                    ShopItemDescriptionAttribute(
                      width: MediaQuery.of(context).size.width * 0.45,
                      title: "RESPECT",
                      subtitle: widget.item.model.respectValue.toString(),
                      color: AppColors.blue,
                      icon: Icons.ads_click_rounded,
                    ),
                  ],
                ),
                ShopItemDescriptionAttribute(
                  width: double.infinity,
                  title: "desctiption",
                  subtitle: widget.item.model.description.toString(),
                  color: AppColors.blue,
                ),
                ShopItemDescriptionAttribute(
                    width: double.infinity,
                    title: "IQ price",
                    subtitle: widget.item.model.iqPrice.toString(),
                    color: AppColors.red,
                    icon: Icons.motion_photos_on_rounded),
                ShopItemDescriptionAttribute(
                    width: double.infinity,
                    title: "Respect price",
                    subtitle: widget.item.model.respectPrice.toString(),
                    color: AppColors.red,
                    icon: Icons.motion_photos_on_rounded),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yellow,
        onPressed: () {
          context.read<BuyBloc>().add(BuyButtonPressed(widget.item));
        },
        child: Icon(
          Icons.monetization_on_outlined,
          color: AppColors.earth,
        ),
      ),
    );
  }
}

class ShopItemDescriptionAttribute extends StatefulWidget {
  final double width;
  final String title;
  final String subtitle;
  final Color color;
  final IconData? icon;

  const ShopItemDescriptionAttribute({Key? key, required this.width, required this.title, required this.subtitle, required this.color, this.icon})
      : super(key: key);

  @override
  State<ShopItemDescriptionAttribute> createState() => _ShopItemDescriptionAttributeState();
}

class _ShopItemDescriptionAttributeState extends State<ShopItemDescriptionAttribute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      constraints: BoxConstraints(minHeight: 100),
      width: widget.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: widget.color.withOpacity(0.9), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.end,
              ),
              Icon(
                widget.icon,
                size: widget.icon == null ? 0 : 25,
                color: AppColors.base,
              )
            ],
          )
        ],
      ),
    );
  }
}
