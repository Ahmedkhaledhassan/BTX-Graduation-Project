import 'package:btxproject2/consatant/constant.dart';
import 'package:btxproject2/consatant/drawer/drawer_home.dart';
import 'package:btxproject2/consatant/responsive.dart';
import 'package:btxproject2/pages/students_affairs/essensial_data/essential_data.dart';
import 'package:flutter/material.dart';

class MainScreenEssentialData extends StatelessWidget {
  const MainScreenEssentialData({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color1 = HexColor('#3E6BA9');
    // It provide us the width and height
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Responsive.isMobile(context) || size.height < 500
          ? const Drawer(
              child: DrawerHome(),
            )
          : null,
      appBar: AppBar(
          actions: [
            Image.asset("assets/img/image1.png"),
            const SizedBox(
              width: 1,
            ),
          ],
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: Text(
                  "شئون الطلاب",
                  style: TextStyle(
                    fontSize: size.width <= 364 ? 17 : 20,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: color1),
      body: Responsive(
        // Let's work on our mobile part
        mobile: EssentialData(),
        tablet: Row(
          children: [
            if (size.height > 500 || size.width < 100)
              const Expanded(flex: 2, child: DrawerHome()),
            Expanded(
              flex: 5,
              child: EssentialData(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: size.width > 1340 ? 2 : 2,
              child: const DrawerHome(),
            ),
            Expanded(
              flex: size.width > 1340 ? 5 : 7,
              child: EssentialData(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(fit: StackFit.passthrough, children: [
        Container(
          height: 35,
          color: color1,
          child: Center(
              child: Text(
                  "جميع الحقوق محفوظة © طلاب جامعة بني سويف التكنولوجية",
                  style: TextStyle(
                      fontSize: size.width <= 380 ? 10 : 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        )
      ]),
    );
  }
}
