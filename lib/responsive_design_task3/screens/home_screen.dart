import 'package:flutter/material.dart';
  import 'package:task/responsive_design_task3/widgets/nav_menu.dart';
import 'package:task/responsive_design_task3/widgets/responsive_builders.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilders(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: mobileAppBar(),
        drawer: const buildDrawer(),
        body: buildMobileBody());
  }


  Widget _buildTabletLayout() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: tabletAppbar(),
        body:   buildMobileBody());
  }
  Widget _buildDesktopLayout() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: tabletAppbar(),
      body: buildDesktopBody(),
    );
  }
  AppBar mobileAppBar() {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Humming".toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Text(
                "bird .".toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
  AppBar tabletAppbar() {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Humming".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            Text(
              "bird .".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () => {},
                child: const Text("Episodes", style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () => {},
                child: const Text("About", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget buildMobileBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Flutter Web.".toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                "the basic".toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const Text(
                "It is a long established fact that a reader will be distracted by the eadable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff1FE590),
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
                child: Text(
                  "Join course",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDesktopBody() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Web.".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  Text(
                    "the basic".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by the eadable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff1FE590),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        child: Text(
                          "Join course",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
