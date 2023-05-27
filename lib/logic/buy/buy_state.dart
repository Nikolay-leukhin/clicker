part of 'buy_bloc.dart';

@immutable
abstract class BuyState {}

class BuyInitial extends BuyState {}


class BuyLoading extends BuyState {}
class BuySuccess extends BuyState {}
class BuyFailed extends BuyState {}
