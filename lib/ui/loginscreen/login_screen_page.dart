import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myflutter/data/model/topic.model.dart';
import 'package:myflutter/data/topic_data.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreenPage extends StatelessWidget {
  const LoginScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _Mobile_Screen(),
      tablet: _Tablet_Screen(),
      desktop: _Desktop_Screen(), // Thêm layout cho desktop
    );
  }
}

class _Desktop_Screen extends StatelessWidget {
  const _Desktop_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: Text('Desktop Screen'));
  }
}

class _Tablet_Screen extends StatelessWidget {
  const _Tablet_Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationLayoutBuilder(
      portrait: (context) => _Tablet_Portrait(),
      landscape: (context) => Container(color: Colors.white),
    );
  }
}

class _Tablet_Portrait extends StatelessWidget {
  const _Tablet_Portrait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Container(
            color: Colors.red,
            child: Column(
              children: [Spacer(), Expanded(child: _Header()), Spacer()],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: Container(
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}

class _Mobile_Screen extends StatelessWidget {
  const _Mobile_Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationLayoutBuilder(
      portrait: (context) => Mobile_Portrait(),
      landscape: (context) => Container(
          color: Colors.red), // Đã bổ sung layout cho mobile landscape
    );
  }
}

class Mobile_Portrait extends StatelessWidget {
  final topicStore = AssestTopicData();

  Mobile_Portrait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: _Header(),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: FutureBuilder<List<Topic>>(
                future: topicStore.loadDataTopic(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                  }
                  // print(snapshot.data);
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final topics = snapshot.data;
                  return MasonryGridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: topics!.length,
                    itemBuilder: (context, index) {
                      final topic = topics[index];
                      return DecoratedBox(
                          decoration: BoxDecoration(
                              color: topic.bgColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                LayoutBuilder(builder: (context, constraints) {
                                  return SvgPicture.asset(
                                    topic.thumbnail,
                                    width: constraints.maxWidth,
                                  );
                                }),
                                SizedBox(height: 24),
                                Text(
                                  textAlign: TextAlign.center,
                                  topic.title,
                                  style: TextStyle(
                                      color: topic.textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 17),
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'App này mang lại',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'minh',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    alignment: FractionalOffset.centerLeft,
                    child: Text(
                      'cho bạn điều gì ?',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: FittedBox(
              alignment: FractionalOffset.centerLeft,
              child: Text(
                'Hãy chọn mục tiêu bạn nhắm tới: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
