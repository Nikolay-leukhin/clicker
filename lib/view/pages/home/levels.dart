import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';

Map<String, String> levels = {
  'котенок': 'assets/cat.png',
  'амогус': 'assets/amogus.png',
  'гуманоид': 'assets/guma.png',
  'герой земли': 'assets/hero.png',
  'профессор': 'assets/prof.png',
  'падж': 'assets/pudge.jpg'
};

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('уровни'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.yellow
        ),
        child: ListView(
          children: const [
            LevelsItem(
              description: "лишь маленький котик, обиженный жизнью",
              name: 'котенок',
            ),
            SizedBox(
              height: 10,
            ),
            LevelsItem(
              description: "успешный молодой амбициозный босс",
              name: 'амогус',
            ),
            SizedBox(
              height: 10,
            ),
            LevelsItem(
              description: "его мольбы услышал сам дьявол",
              name: 'гуманоид',
            ),
            SizedBox(
              height: 10,
            ),
            LevelsItem(
              description: "внебрачный сын альберта энштейна",
              name: 'профессор',
            ),
            SizedBox(
              height: 10,
            ),
            LevelsItem(
              description: "царь. боженька. владыка и проч",
              name: 'падж',
            ),
            SizedBox(
              height: 10,
            ),
            LevelsItem(
              description: "перекачанный маминкин сынок",
              name: 'амогус',
            ),
            SizedBox(
              height: 10,
            ),
            LevelsItem(
              description: "на пути к успеху вечно молодой вечно пьяный суперстар",
              name: 'герой земли',
            ),
          ],
        ),
      ),
    );
  }
}

class LevelsItem extends StatelessWidget {
  final String name;
  final String description;
  const LevelsItem({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(width: 2, color: AppColors.base)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 5,
          ),
          Text(description, style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
