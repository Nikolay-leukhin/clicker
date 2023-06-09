import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:bloc/bloc.dart';
import 'package:clicker/logic/buy/buy_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/user_repository.dart';
import '../bless/bless_bloc.dart';
import '../iq/iq_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IqBloc iqBloc;
  final BlessBloc blessBloc;
  final BuyBloc buyBloc;
  final UserRepository userRepository;

  late var blocsStreams;

  ProfileBloc({required this.iqBloc, required this.blessBloc, required this.userRepository, required this.buyBloc}) : super(ProfileInitial()) {
    blocsStreams = StreamGroup.merge([iqBloc.stream, blessBloc.stream, buyBloc.stream]);
    _subscription();
    on<ProfileEvent>((event, emit) {});
  }

  void _subscription() {
    blocsStreams.listen((event) {
      if (event is IqScoreIncreased || event is BlessScoreIncreased) {
        userRepository.updateUserLevel(userRepository.iq, userRepository.respectScore, userRepository.successScore, userRepository.respectIncrementSetter);
      }
      if (event is BuySuccess){
        userRepository.updateUserSuccess(userRepository.iq, userRepository.respectScore);
      }
    });
  }
}
