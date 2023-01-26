import 'package:flutter/material.dart';
import 'package:party_ui/pages/fade_animation.dart';

class HomePage2 extends StatefulWidget {
  static const String id = "home_page_2";

  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  bool _isLogin = false;
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
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
              top: MediaQuery.of(context).size.height * 0.15,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.1),
                ])),
            child: FadeAnimation(
                7,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Find the best\nparties near you.",
                      style: TextStyle(
                          color: Color.fromRGBO(210, 192, 53, 1),
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      "Let us find you a party for\nyourinterest",
                      style: TextStyle(
                          color: Color.fromRGBO(99, 199, 141, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.52,
                    ),
                    !_isLogin
                        ? MaterialButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = true;
                              });
                            },
                            height: MediaQuery.of(context).size.height * 0.05,
                            minWidth: double.infinity,
                            shape: const StadiumBorder(),
                            color: Colors.orange,
                            child: const Text(
                              "Start",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.4,
                                shape: const StadiumBorder(),
                                color: Colors.red,
                                child: const Text(
                                  "Google",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.4,
                                shape: const StadiumBorder(),
                                color: Colors.blue,
                                child: const Text(
                                  "Facebook",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
