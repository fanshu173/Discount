import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

import '../invite/invite_fragment.dart';
import '../utils/common.dart';
import 'info_detail_page.dart';

//资讯页
class InfoFragment extends StatefulWidget {
  const InfoFragment({Key? key}) : super(key: key);

  @override
  State<InfoFragment> createState() => _InfoFragmentState();
}

class _InfoFragmentState extends State<InfoFragment> {
  int _count = 10;
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.white ,
        title: const Text('ShareCash'),
      ),
      body: EasyRefresh(
        controller: _controller,
        header: const ClassicHeader(),
        footer: const ClassicFooter(),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 4));
          if (!mounted) {
            return;
          }
          setState(() {
            _count = 10;
          });
          _controller.finishRefresh();
          _controller.resetFooter();
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 4));
          if (!mounted) {
            return;
          }
          setState(() {
            _count += 5;
          });
          _controller.finishLoad(
              _count >= 20 ? IndicatorResult.noMore : IndicatorResult.success);
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {CommonUtil.push(context, const InfoDetailPage())},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: _buildArtItem(index),
              ),
            );
          },
          itemCount: _count,
        ),
      ),
    );
  }

  _buildArtItem(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                maxLines:3,
                overflow:TextOverflow.ellipsis,
                style:TextStyle(fontSize:16),
                '${index + 1}' +
                  "Negros Occidental governordeclares support for Sotto's vicepresidential bid - Manila Bulletin"),
              flex: 2,
            ),
            Expanded(child: Image.asset(
              "assets/images/icon_loading_failed.png",
              width: 150,
              height: 80,
              fit: BoxFit.fill,
            ),flex: 1,)
          ],
        ),
        Row(
          children: [
            Expanded(child: Text('0.2/view'),
            flex: 2,),
            Expanded(child: TextButton.icon(
                onPressed: _onPressed,
                icon: Image.asset(
                  "assets/images/share.png",
                  width: 20,
                  height: 20,
                ),
                label: Text('ShareCash')),flex: 1,)
            ,
          ],
        ),
        Container(
          color:Colors.grey[300],
          height: 1,
        )
      ],
    );
  }

  _onPressed() {}
}
