import 'package:clicker/data/repository/user_repository.dart';
import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'levels.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backblue.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("level ${context.read<UserRepository>().level.toUpperCase()}", style: Theme.of(context).textTheme.headlineMedium),
            Container(
              constraints: BoxConstraints(
                maxWidth: 300,
                maxHeight: 300
              ),
              child: Image(
                image: AssetImage(levels[context.read<UserRepository>().level] ?? 'assets/pudge.jpg'),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("IQ:", style: Theme.of(context).textTheme.bodyMedium),
                      Text(context.read<UserRepository>().iq.toString(), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Респект физички:", style: Theme.of(context).textTheme.bodyMedium),
                      Text(context.read<UserRepository>().respectScore.toString(), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Успех:", style: Theme.of(context).textTheme.bodyMedium),
                      Text("${context.read<UserRepository>().successScore.toString()}%", style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LevelsPage()));
      }, child: Icon(Icons.question_mark),),
    );
  }
}
