import 'dart:math';

import 'package:clicker/data/repository/abstract_user_repository.dart';

class UserRepository extends AbstractUserRepository{
  @override
  void increaseIq() {
    iq += iqIncrementSetter;
  }

  @override
  void increaseRespect() {
    respectScore += respectIncrementSetter;
  }

  @override
  void updateIqSetter(int newIqSetter) {
    this.iqIncrementSetter += newIqSetter;
  }

  @override
  void updateRespectSetter(int newRespectSetter) {
    this.respectIncrementSetter += newRespectSetter;
  }

  @override
  void chargeIq(int price) {
    this.iq -= price;
  }

  @override
  void chargeRespect(int price) {
    this.respectScore -= price;
  }

  @override
  void updateUserSuccess(int curIq, int curRespect) {
    this.successScore = ((curRespect / curIq)).round() / 10000;
  }
}
