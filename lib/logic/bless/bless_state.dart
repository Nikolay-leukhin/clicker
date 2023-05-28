part of 'bless_bloc.dart';

@immutable
abstract class BlessState {}

class BlessInitial extends BlessState {}
class BlessScoreIncreased extends BlessInitial {}
