import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoritePage extends StatefulWidget {
  String? imagePath;
  String? title;

  FavoritePage({
    super.key,
    this.imagePath,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 19, 19, 1),
      body: (widget.imagePath == null)
          ? Container(
              color: Colors.amberAccent,
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      // fit: StackFit.expand,
                      children: [
                        Stack(
                           alignment: Alignment.topCenter,
                           fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: -13,
                              child: Image.asset(
                                widget.imagePath!,
                                height: 551,
                                width: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 458,
                          child: Container(
                            height: 406,
                            width: 661,
                            decoration: const BoxDecoration(
                                // color:  Color.fromARGB(255, 64, 255, 191),
                                color: Color.fromRGBO(24, 24, 24, 0.01),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(19, 19, 19, 1),
                                      blurRadius: 400,
                                      spreadRadius: 50)
                                ]),
                          ),
                        ),
                        Positioned(
                          top: 475,
                          left: 94,
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 87,
                            width: 211,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title!,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(230, 154, 21, 1)),
                                  ),
                                  const Text("Youlakou",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            top: 518,
                            left: 348,
                            child: Icon(
                              Icons.ios_share,
                              size: 25,
                              color: Color.fromRGBO(230, 154, 21, 1),
                            )),
                        const Positioned(
                          top: 562,
                          left: 333,
                          child: Text("4 min",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                        ),
                        const Positioned(
                          top: 565,
                          left: 17,
                          child: Text("Dynamic Warmup | ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                        ),
                        Positioned(
                          top: 594,
                          child: SizedBox(
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: LinearProgressIndicator(
                                color: const Color.fromRGBO(230, 154, 21, 1),
                                backgroundColor:
                                    const Color.fromRGBO(217, 217, 217, 0.19),
                                minHeight: 6,
                                value: controller.value,
                                semanticsLabel: 'Linear progress indicator',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 622,
                          child: SizedBox(
                            // width: MediaQuery.of(context).viewInsets.left,
                            width: 400,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.shuffle_on_outlined,
                                    size: 20,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  const Icon(
                                    Icons.skip_previous_rounded,
                                    size: 25,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1)),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      size: 50,
                                      // color: Color.fromRGBO(255,255,255,1),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.skip_next_rounded,
                                    size: 25,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  const Icon(
                                    Icons.volume_up_rounded,
                                    size: 24,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
