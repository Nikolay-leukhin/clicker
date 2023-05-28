import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/repository/user_repository.dart';
import '../../../logic/bless/bless_bloc.dart';

class BlessPage extends StatefulWidget {
  const BlessPage({Key? key}) : super(key: key);

  @override
  State<BlessPage> createState() => _BlessPageState();
}

class _BlessPageState extends State<BlessPage> {
  bool _toogle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backblue.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
              decoration: BoxDecoration(
                color: AppColors.earth,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: BlocBuilder<BlessBloc, BlessState>(
                bloc: context.read<BlessBloc>(),
                builder: (context, state) {
                  return Text(context.read<UserRepository>().respectScore.toString());
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
                  context.read<BlessBloc>().add(BlessIncreaseButtonClicked());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.86,
                  height: MediaQuery.of(context).size.width * 0.77,
                  child: AnimatedContainer(
                    onEnd: () {
                      setState(() {
                        if (_toogle) {
                          _toogle = !_toogle;
                        }
                      });
                    },
                    duration: Duration(milliseconds: 90),
                    width: _toogle ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.86,
                    height: _toogle ? MediaQuery.of(context).size.width * 0.7 : MediaQuery.of(context).size.width * 0.77,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/knees.png"),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
