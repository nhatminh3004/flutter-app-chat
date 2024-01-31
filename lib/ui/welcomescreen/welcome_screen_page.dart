import 'package:flutter/material.dart';

class WelcomeScreenPage extends StatelessWidget {
  final VoidCallback backPressed;
  const WelcomeScreenPage({super.key, required this.backPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.red,
            child: Column(
              children: [
                _buildBackButton(),
                SizedBox(
                  height: 58,
                ),
                _buildTitleAndContent(),
                SizedBox(
                  height: 370,
                ),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
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
            'Chào mừng đến với ứng dụng Task ToDo',
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
