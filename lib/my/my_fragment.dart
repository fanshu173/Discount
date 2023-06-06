import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import '../utils/common.dart';

//资讯页
class MyFragment extends StatefulWidget {
  const MyFragment({Key? key}) : super(key: key);

  @override
  State<MyFragment> createState() => _MyFragmentState();
}

class _MyFragmentState extends State<MyFragment> {
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0.0, elevation: 0.0, backgroundColor: Colors.red),
      body: EasyRefresh(
          controller: _controller,
          header: const ClassicHeader(),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 4));
            if (!mounted) {
              return;
            }
            _controller.finishRefresh();
            _controller.resetFooter();
          },
          child: ListView.builder(
              itemCount: iconList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildTitle();
                }
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: _buildNavItem(index - 1),
                  ),
                );
              })),
    );
  }

  var iconList = [
    'assets/images/icon_me_invitation.png',
    'assets/images/icon_me_income.png',
    'assets/images/icon_me_share.png',
    'assets/images/icon_me_collect.png',
    'assets/images/icon_me_help.png',
    'assets/images/icon_me_setting.png',
  ];
  var titleList = [
    '	Bind InviteCode	',
    '	Income Record	',
    '	SharingRecord	',
    '	Collection	',
    '	Beginner\'s Guide	',
    '	Settings	'
  ];
//功能导航：收入记录、分享记录、我的收藏、新手指引、设置
  _buildNavItem(int index) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(iconList[index], width: 30, height: 30),
                SizedBox(width: 20),
                Text(titleList[index]),
              ],
            ),
            SizedBox(height: 12),
            Container(color: Colors.grey[300], height: 1),
          ],
        ),
        Positioned(
            child: Image.asset('assets/images/icon_me_go.png',
                width: 15, height: 15)),
      ],
    );
  }

//邮箱头像的构建
  _buildEmail() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage("assets/images/icon_loading_failed.png"),
        ),
        SizedBox(width: 20.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'youxiang@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'My InviteCode: 10065261',
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }

  /**
   * My Balance +Total Earnings
   */
  _buildMoney({required String money, required String name}) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(money,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red))
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Container(
          color: Colors.red,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          height: 170.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildEmail(),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                color: Color.fromRGBO(49, 47, 47, 1).withAlpha(100),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Text(
                        'Today\'s Earnings: P0.00',
                        style: TextStyle(color: Colors.white),
                      ),
                      left: 0.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(width: 20),
                        ElevatedButton(
                          child: Text("Withdraw Now",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        //钱包、总收益，暗黄色
        Container(
            color: Colors.yellow[600],
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildMoney(name: 'My Balance', money: '伊0.00'),
                SizedBox(width: 80),
                _buildMoney(name: 'Total Earnings', money: '伊0.00')
              ],
            )),
        SizedBox(height: 10),
        // 导航列表：收入记录 、分享记录、我的收藏、新手指引、设置
      ],
    );
  }
}
