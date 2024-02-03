import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreenPage extends StatelessWidget {
  final VoidCallback backPressed;
  final VoidCallback getStartedPressed;
  const WelcomeScreenPage(
      {super.key, required this.backPressed, required this.getStartedPressed});

  @override
  Widget build(BuildContext context) {
    final orirentation = MediaQuery.of(context).orientation;
    final sizeManhinh = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF8E97FD),
      body: SafeArea(
          child: orirentation == Orientation.portrait
              ? Stack(
                  children: [
                    WelcomeBackgoundWidget(),
                    WelcomeContentWidget(
                      backPressed: () {
                        backPressed();
                      },
                    ),
                    Align(
                      alignment:
                          Alignment(0.0, sizeManhinh.width > 800 ? -0.2 : 0.9),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF3F414E),
                            backgroundColor: Color(0xFFEBEAEC),
                            fixedSize: Size(sizeManhinh.width * 0.8,
                                sizeManhinh.height * 0.065),
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(38))),
                        onPressed: () {
                          getStartedPressed();
                        },
                        child: Text(
                          'GET STARTED',
                          style:
                              TextStyle(fontSize: sizeManhinh.height * 0.015),
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                        child: WelcomeContentWidget(
                      backPressed: () {},
                    )),
                    Expanded(child: WelcomeBackgoundWidget()),
                  ],
                )),
    );
  }
}

class WelcomeBackgoundWidget extends StatelessWidget {
  const WelcomeBackgoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientatiton = MediaQuery.of(context).orientation;
    return Container(
      // color: Colors.yellow,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: FractionallySizedBox(
                heightFactor: orientatiton == Orientation.landscape ? 1 : 0.7,
                widthFactor: 1,
                child: Container(
                  // color: Colors.red,
                  child: FittedBox(
                      // clipBehavior: Clip.antiAlias,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset('assets/images/bg_welcome.svg')),
                )),
          )),
    );
  }
}

class WelcomeContentWidget extends StatelessWidget {
  final VoidCallback backPressed;

  const WelcomeContentWidget({
    super.key,
    required this.backPressed,
  });

  @override
  Widget build(BuildContext context) {
    final sizeManhinh = MediaQuery.of(context).size;
    return Container(
      // color: Colors.yellow,
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.4,
        child: Column(
          children: [
            // _buildBackButton(),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: sizeManhinh.width * 0.024),
                    // color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          backPressed();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/ic_logo.svg',
                    alignment: Alignment.topCenter,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                // color: Colors.red,
                child: FittedBox(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: 'Xin chào bạn, Chào mừng \n',
                        style: TextStyle(
                          fontFamily: 'Minh',
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFFECCC),
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Bạn đã trở lại',
                            style: TextStyle(
                                fontFamily: 'Minh',
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                // color: Colors.red,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Hãy ấn bắt đầu để tiến hành đăng nhập\nNếu chưa có tài khoản '
                        'hãy nhanh tay ấn đăng ký',
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Minh',
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFEBEAEC)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
