import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifecycle/lifecycle.dart';

import 'package:ngopay/douyin/page/home/page/douyin_home_cicy_page.dart';
import 'package:ngopay/douyin/page/home/page/douyin_home_focus_page.dart';
import 'package:ngopay/douyin/page/home/page/douyin_home_recommend_page.dart';

/// @author jd
/// 首页

class DouYinHomePage extends StatefulWidget {
  @override
  _DouYinHomePageState createState() => _DouYinHomePageState();
}

class _DouYinHomePageState extends State<DouYinHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _tabs = [
    <String, dynamic>{
      'title': '同城',
      'page': DouyinHomeCityPage(),
    },
    <String, dynamic>{
      'title': '关注',
      'page': DouyinHomeoFocusPage(),
    },
    <String, dynamic>{
      'title': '推荐',
      'page': const DouyinHomeRecommendPage(
        source: 'home',
      ),
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildBackground(),
            _buildContentPage(),
            _buildTopMenu(),
          ],
        ),
      ),
    );
  }

  /// ****  背景 ********/
  Widget _buildBackground() {
    return Container(
      color: Colors.black,
    );
  }

  @override
  void deactivate() {
    debugPrint('deactivate');
    super.deactivate();
  }

  /// ****  顶部菜单 ********/

  Widget _buildTopMenu() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 80,
                child: IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              _buildTabbar(),
              Container(
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTabbar() {
    return SizedBox(
      width: 200,
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.white,
        tabs: _tabs
            .map(
              (e) => Tab(
                child: Text(
                  e['title'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildContentPage() {
    return PageViewLifecycleWrapper(
      child: TabBarView(
        controller: _tabController,
        children: _tabs
            .map(
              (e) => ChildPageLifecycleWrapper(
                index: _tabs.indexOf(e),
                child: e['page'] as Widget,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
