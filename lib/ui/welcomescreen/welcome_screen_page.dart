import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreenPage extends StatelessWidget {
  final VoidCallback backPressed;
  const WelcomeScreenPage({super.key, required this.backPressed});

  @override
  Widget build(BuildContext context) {
    final orirentation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: const Color(0xFF8E97FD),
      body: SafeArea(
          child: orirentation == Orientation.portrait
              ? const Stack(
                  children: [
                    WelcomeBackgoundWidget(),
                    WelcomeContentWidget(),
                  ],
                )
              : const Row(
                  children: [
                    Expanded(child: WelcomeContentWidget()),
                    Expanded(child: WelcomeBackgoundWidget()),
                  ],
                )),
    );
  }

  Widget _buildBackButton() {
    return Container(
      margin: EdgeInsets.only(
        top: 24,
        left: 13,
      ),
      // color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              backPressed();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndContent() {
    return Column(
      children: [
        Container(
          // color: Colors.yellow,
          child: Text(
            textAlign: TextAlign.center,
            'Chào mừng đến với ứng dụng Chat',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF).withOpacity(0.87),
            ),
          ),
        ),
        Container(
          // color: Colors.black38,
          margin: EdgeInsets.only(top: 26, left: 44, right: 44),
          child: Text(
            textAlign: TextAlign.center,
            'Vui lòng đăng nhập để sử dụng ứng dụng nếu có tài khoản '
            'hoặc đăng ký nếu chưa có tài khoản',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xFFFFFFFF).withOpacity(0.67),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 50,
      ),
      // color: Colors.white30,
      child: Column(
        children: [
          Container(
            // color: Colors.orange,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Đăng nhập',
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                minimumSize: Size(327, 48),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF8875FF),
              ),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Container(
            // color: Colors.orange,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'Đăng ký',
              ),
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: Color(0xFF8875FF),
                    width: 3,
                  ),
                  minimumSize: Size(327, 48),
                  foregroundColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeBackgoundWidget extends StatelessWidget {
  const WelcomeBackgoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
              heightFactor: 0.5,
              widthFactor: 1,
              child: Container(
                // color: Colors.red,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: SvgPicture.asset('assets/images/bg_welcome.svg')),
              ))),
    );
  }
}

class WelcomeContentWidget extends StatelessWidget {
  const WelcomeContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.5,
        child: Container(
          // color: Colors.red,
          child: Column(
            children: [
              // _buildBackButton(),
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/images/ic_logo.svg',
                    alignment: Alignment.topCenter,
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Xin chào bạn, Chào mừng',
                        style: TextStyle(
                          fontFamily: 'Poppins-Bold',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFECCC),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Bạn đã trở lại',
                        style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Hãy ấn bắt đầu để tiến hành đăng nhập, Nếu chưa có tài khoản '
                        'hãy nhanh tay ấn đăng ký',
                        style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFEBEAEC)),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
