part of 'buy_bloc.dart';

@immutable
abstract class BuyEvent {}


class BuyButtonPressed extends BuyEvent{
  final ShopItemCard item;

  BuyButtonPressed(this.item);
}