import 'package:flutter/material.dart';
import 'package:party_ui/pages/fade_animation.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String buttonText = "Start";
  Color buttonColor = Colors.orange;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/im_party.jpeg"),
                fit: BoxFit.cover)),
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
                vertical: MediaQuery.of(context).size.height * 0.08),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.1),
                ])),
            child: FadeAnimation(
                7,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Find the best\nparties near you.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Let us find you a party for your\ninterest",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          buttonColor = Colors.red;
                          buttonText = "Google+";
                        });
                      },
                      height: MediaQuery.of(context).size.height * 0.05,
                      minWidth: double.infinity,
                      shape: const StadiumBorder(),
                      color: buttonColor,
                      child: Text(
                        buttonText,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
