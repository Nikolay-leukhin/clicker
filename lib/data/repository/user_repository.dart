import 'package:clicker/data/repository/abstract_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository extends AbstractUserRepository{
  late final SharedPreferences prefs;

  UserRepository(this.prefs);

  late int iq = prefs.getInt("iq") ?? 0;
  late int respectScore = prefs.getInt("respect") ?? 0;
  late double successScore = prefs.getDouble("success") ?? 0;
  late int iqIncrementSetter = prefs.getInt("iqSetter") ?? 1;
  late int respectIncrementSetter = prefs.getInt("respectSetter") ?? 1;
  late String level = prefs.getString("level") ?? 'котенок';

  @override
  Future saveData() async {
    prefs.setInt('iq', iq);
    prefs.setInt('respect', respectScore);
    prefs.setDouble('success', successScore);
    prefs.setInt('iqSetter', iqIncrementSetter);
    prefs.setInt('respectSetter', respectIncrementSetter);
    prefs.setString('level', level);
  }

  @override
  void increaseIq() {
    this.iq += iqIncrementSetter;
  }

  @override
  void increaseRespect() {
    this.respectScore += respectIncrementSetter;
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
    if (curIq != 0 && curRespect != 0){
      this.successScore = (((curRespect / (curIq))).round() / 10) % 100;
    }else{
      this.successScore = 0;
    }

  }

  @override
  void updateUserLevel(int iq, int respect, double success, int respectIncrementSetter) {
    if (success > 75 && (respectIncrementSetter > 15)){
      level = 'амогус';
    }else if  (success >= 50){
      level = 'герой земли';
    }else if (iq / respect > 100){
      level = 'профессор';
    }else if (respect / iq > 100){
      level = 'гуманоид';
    }else if ((respect == iq) && (iq > 11)){
      level = 'падж';
    }else{
      level = 'котенок';
    }
  }
}
