import 'package:clicker/view/pages/home/bless_page.dart';
import 'package:clicker/view/pages/home/iq_page.dart';
import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';

class ClickerPage extends StatefulWidget {
  const ClickerPage({Key? key}) : super(key: key);

  @override
  State<ClickerPage> createState() => _ClickerPageState();
}

class _ClickerPageState extends State<ClickerPage> {
  final PageController pageController = PageController();
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_activePage == 0 ? "IQ TRAIN" : "Blessing")),
      body: Stack(children: [
        PageView(
          onPageChanged: (int ind){
            setState(() {
              _activePage = ind;
            });
          },
          controller: pageController,
          children: [
            IqPage(),
            BlessPage()
          ],
        ),
        Positioned(
          bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(2, (index) =>
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 4),
                      color: _activePage == index ? AppColors.yellow : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                  )
                )
            )
        )
      ]),
    );
  }
}
