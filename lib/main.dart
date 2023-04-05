import 'package:fitness_app/bottomnavBar.dart';
import 'package:fitness_app/categorycard.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/detailsScreen.dart';
import 'package:fitness_app/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png")),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 68, 63, 61),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Text(
                  "Good morning\n sir/madam",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                SearchBar(),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    CategoryCard(
                        svgSrc: "assets/icons/Hamburger.svg",
                        title: "Diet recommendation",
                        press: () {}),
                    CategoryCard(
                        svgSrc: "assets/icons/Excrecises.svg",
                        title: "kegel exercises",
                        press: () {}),
                    CategoryCard(
                        svgSrc: "assets/icons/Meditation.svg",
                        title: " Meditation",
                        press: () {}),
                    CategoryCard(
                        svgSrc: "assets/icons/yoga.svg",
                        title: "yoga",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }),
                          );
                        })
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
