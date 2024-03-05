import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Figma to Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// Menu icon widget w. text
class _MyHomePageState extends State<MyHomePage> {
  Widget _menuIcon(String text, Widget icon) {
    return SizedBox(
      height: 42,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFA78D78),
              fontSize: 11,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
              height: 1.11,
              letterSpacing: 0.55,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Original Figma design png
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Original Figma Design (image width 375):',
                  textAlign: TextAlign.center),
            ),
            Image.asset(
              'assets/images/BottomNavMenu.png',
            ),
            const SizedBox(height: 48),

            // Original design image scaled to fit actual width of the device
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  'Original image scaled to fit actual width of ${MediaQuery.of(context).size.width}:',
                  textAlign: TextAlign.center),
            ),
            Image.asset(
              'assets/images/BottomNavMenu.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 48),

            // Flutter implementation using font and icon sizes as in Figma
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'Flutter implementation using font and icon sizes as in Figma:',
                  textAlign: TextAlign.center),
            ),
            Container(
                color: Colors.white,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Offers icon
                    _menuIcon(
                        'Offers',
                        SvgPicture.asset(
                          'assets/images/menu_offers_icon.svg',
                          height: 24,
                          width: 24,
                        )),
                    const SizedBox(width: 48),

                    // Plus icon in the middle
                    Container(
                      width: 58,
                      height: 42,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFA78D78),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/menu_add_offer_icon.svg',
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),

                    // Orders icon
                    _menuIcon(
                        'Orders',
                        SvgPicture.asset(
                          'assets/images/menu_orders_icon.svg',
                          height: 24,
                          width: 24,
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
