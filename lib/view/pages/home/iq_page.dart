import 'dart:ui';

import 'package:clicker/data/repository/user_repository.dart';
import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/iq/iq_bloc.dart';

class IqPage extends StatefulWidget {
  const IqPage({Key? key}) : super(key: key);

  @override
  State<IqPage> createState() => _IqPageState();
}

class _IqPageState extends State<IqPage> {
  bool _toogle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backblue.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
                decoration: BoxDecoration(color: AppColors.earth, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: BlocBuilder<IqBloc, IqState>(
                  bloc: context.read<IqBloc>(),
                  builder: (context, state) {
                    return Text(context.read<UserRepository>().iq.toString());
                  },
                ),
              ),
              SizedBox(
                height:15,
              ),
              Text("+IQ/click : ${context.read<UserRepository>().respectIncrementSetter.toString()}", style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _toogle = !_toogle;
                    });
                    context.read<IqBloc>().add(IqIncreaseButtonClicked());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: AnimatedContainer(
                      onEnd: () {
                        setState(() {
                          if (_toogle) {
                            _toogle = !_toogle;
                          }
                        });
                      },
                      duration: Duration(milliseconds: 90),
                      width: _toogle ? MediaQuery.of(context).size.width * 0.75 : MediaQuery.of(context).size.width * 0.8,
                      height: _toogle ? MediaQuery.of(context).size.height * 0.36 : MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/brains.png"),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
