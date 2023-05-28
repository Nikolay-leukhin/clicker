import 'package:clicker/data/repository/user_repository.dart';
import 'package:clicker/logic/iq/iq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'logic/bless/bless_bloc.dart';
import 'logic/buy/buy_bloc.dart';
import 'logic/profile/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final UserRepository _userRepository = UserRepository(prefs);

  runApp(RepositoryProvider(
    create: (_) => _userRepository,
    child: MultiRepositoryProvider(providers: [
      BlocProvider(
        create: (context) => IqBloc(_userRepository),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => BlessBloc(_userRepository),
        lazy: false,
      ),
      BlocProvider(create: (context) => BuyBloc(_userRepository)),
      BlocProvider(
        create: (context) => ProfileBloc(userRepository: _userRepository, iqBloc: context.read<IqBloc>(), blessBloc: context.read<BlessBloc>()),
        lazy: false,
      ),
    ], child: App()),
  ));
}
