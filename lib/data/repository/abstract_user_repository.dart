abstract class AbstractUserRepository{
  Future saveData();
  void increaseIq();
  void increaseRespect();
  void updateIqSetter(int newIqSetter);
  void updateRespectSetter(int newRespectSetter);
  void chargeIq(int price);
  void chargeRespect(int price);
  void updateUserSuccess(int iq, int respect);
  void updateUserLevel(int iq, int respect, double success, int respectIncrementSetter);
}