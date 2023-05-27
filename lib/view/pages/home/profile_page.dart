import 'package:clicker/data/repository/user_repository.dart';
import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: Text("PROFILE"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical:15, horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backblue.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
            width: 100,
            height:100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/pudge.jpg')
                )
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.blue,
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
    );
  }
}

