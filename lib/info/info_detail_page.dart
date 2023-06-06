import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

//资讯详情页
class InfoDetailPage extends StatefulWidget {
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  State<InfoDetailPage> createState() => _InfoDetailPageState();
}

class _InfoDetailPageState extends State<InfoDetailPage> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.2,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                selectedIcon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                isSelected: _isSelected,
                tooltip: 'favorite',
                onPressed: () => {
                  setState(() {
                    _isSelected = !_isSelected;
                  })
                },
              )
            ]),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Stack(alignment: Alignment.topLeft, children: <Widget>[
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  // physics: const ClampingScrollPhysics(), //重要
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return _buildDetailContent();
                    }
                    //上半部分的标题，在内容中，此方法只有列表项
                    return _buildForYouList();

                    // return SizedBox(
                    //   height: 50,
                    //   child: Center(child: Text('Item $index')),
                    // );
                  }),
              Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 140,
                    width: 400,
                    color: Colors.white.withAlpha(255),
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      children: [
                        Text(
                            "lf the article you share is read once, you can get:¥0.20",
                            style: TextStyle(color: Colors.red)),
                        SizedBox(height: 16.0),
                        SharePanel()
                      ],
                    ),
                  )),
            ]),
          ),
        ));
  }

//构建只有一个。Item的列表这个列表用于显示咨询详情的正文内容。
  Widget _buildDetailContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Negros Occidental governordeclares support for Sotto's vicepresidential bid - Manila Bulletin",
            textAlign: TextAlign.left,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: _buildImageByUrlWithDefalut(''),
        ),
        Text(
            "Negros Occidental governordeclares support for Sotto's vicepresidential bid - Manila Bulletin",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
            )),
        //文章来源：
        Text("View source: Glazyl Masculino",
            style: TextStyle(
              color: Colors.grey.withAlpha(500),
            )),
        SizedBox(height: 16.0),
        // for you 的标题,不做任何修改
        Row(
          children: [
            Container(
              height: 20,
              width: 4,
              color: Colors.red,
            ),
            SizedBox(width: 5.0),
            Text("For You",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey.withAlpha(500),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 5.0),
          ],
        ),
      ],
    );
  }

//加载网络图片，如果网络图片的路径不正确，加载默认图片。
  _buildImageByUrlWithDefalut(String url) {
    if (url.isNotEmpty && url.startsWith('http://')) {
      return Image.network(url, fit: BoxFit.cover);
    }
    return Image.asset(
      "assets/images/icon_loading_failed.png",
      fit: BoxFit.cover,
    );
  }

  //构建for you，推荐链表
  _buildForYouList() {
    int leftFlex = 1, rightFlex = 2;
    ;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 2,
              color: Colors.grey.withAlpha(300),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: _buildImageByUrlWithDefalut(''),
                  ),
                  flex: leftFlex,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    'Family business? PDEAarrests 3 generations of dr...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  flex: rightFlex,
                )
              ],
            ),
            Text('0.2/view'),
            SizedBox(
              height: 16,
            )
          ],
        ),
        Positioned(
            bottom: 0.0,
            right: 0.0,
            child: TextButton.icon(
                onPressed: _onPressed,
                icon: Image.asset(
                  "assets/images/share.png",
                  width: 20,
                  height: 20,
                ),
                label: Text(
                  'ShareCash',
                )))
      ],
    );
  }

  void _onPressed() {}
}

class SharePanel extends StatelessWidget {
  const SharePanel({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = 60.0;
    double _height = _width;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            "assets/images/icon_share_whatsapp.png",
            width: _width,
            height: _height,
          ),
        ),
        Expanded(
          child: Image.asset(
            "assets/images/icon_share_twitter.png",
            width: _width,
            height: _height,
          ),
          flex: 1,
        ),
        Expanded(
          child: Image.asset(
            "assets/images/icon_share_facebook.png",
            width: _width,
            height: _height,
          ),
          flex: 1,
        ),
        Expanded(
          child: Image.asset(
            "assets/images/icon_share_sys.png",
            width: _width,
            height: _height,
          ),
          flex: 1,
        ),
      ],
    );
  }
}
