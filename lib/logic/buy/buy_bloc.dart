import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/user_repository.dart';
import '../../view/pages/home/shop_item.dart';

part 'buy_event.dart';
part 'buy_state.dart';

class BuyBloc extends Bloc<BuyEvent, BuyState> {
  final UserRepository userRepository;
  BuyBloc(this.userRepository) : super(BuyInitial()) {
    on<BuyButtonPressed>(_buyValidate);
  }

  void _buyValidate(event, emit) {
    if ((event.item.model.iqPrice <= userRepository.iq) && ((event.item.model.respectPrice <= userRepository.respectScore))) {
      userRepository.updateIqSetter(event.item.model.iqValue);
      userRepository.updateRespectSetter(event.item.model.respectValue);

      userRepository.chargeIq(event.item.model.iqPrice);
      userRepository.chargeRespect(event.item.model.respectPrice);
      emit(BuySuccess());
    } else {
      emit(BuyFailed());
    }
  }
}
