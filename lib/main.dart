import 'package:clicker/data/repository/user_repository.dart';
import 'package:clicker/logic/iq/iq_bloc.dart';
import 'package:clicker/view/pages/home/homepage.dart';
import 'package:clicker/view/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'logic/bless/bless_bloc.dart';
import 'logic/buy/buy_bloc.dart';

void main() {
  runApp(AppProvider());
}


class AppProvider extends StatelessWidget {
  AppProvider({Key? key}) : super(key: key);

  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => _userRepository,
      child: MultiRepositoryProvider(
          providers: [
            BlocProvider(create: (context) => IqBloc(_userRepository)),
            BlocProvider(create: (context) => BlessBloc(_userRepository)),
            BlocProvider(create: (context) => BuyBloc(_userRepository)),
          ],
          child: App()
      ),
    );
  }
}



