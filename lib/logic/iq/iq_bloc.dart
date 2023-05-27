import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/user_repository.dart';

part 'iq_event.dart';
part 'iq_state.dart';

class IqBloc extends Bloc<IqEvent, IqState> {
  final UserRepository userRepository;
  IqBloc(this.userRepository) : super(IqInitial()) {
    on<IqIncreaseButtonClicked>(_increaseIqScore);
  }

  void _increaseIqScore(event, emit){
    userRepository.increaseIq();
    userRepository.updateUserSuccess(userRepository.iq, userRepository.respectScore);
    emit(ScoreIncreased());
  }
}
