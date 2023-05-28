import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/user_repository.dart';

part 'bless_event.dart';
part 'bless_state.dart';

class BlessBloc extends Bloc<BlessEvent, BlessState> {
  final UserRepository userRepository;
  BlessBloc(this.userRepository) : super(BlessInitial()) {
    on<BlessIncreaseButtonClicked>(_increaseScore);
  }

  void _increaseScore(event, emit) {
    userRepository.increaseRespect();
    userRepository.updateUserSuccess(userRepository.iq, userRepository.respectScore);
    emit(BlessScoreIncreased());
  }
}
