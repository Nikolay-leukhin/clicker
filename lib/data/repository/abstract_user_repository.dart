abstract class AbstractUserRepository{
  int iq = 1;
  int respectScore = 1;
  double successScore = 1.0;
  int iqIncrementSetter = 1;
  int respectIncrementSetter = 1;

  void increaseIq();
  void increaseRespect();
  void updateIqSetter(int newIqSetter);
  void updateRespectSetter(int newRespectSetter);
  void chargeIq(int price);
  void chargeRespect(int price);
  void updateUserSuccess(int iq, int respect);
}