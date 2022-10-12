import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:marquee/marquee.dart';
import 'package:ngopay/douyin/utils/asset_bundle_utils.dart';

import 'package:ngopay/douyin/utils/navigation_util.dart';
import 'package:ngopay/douyin/page/people_detail/page/doiyin_people_detail_page.dart';
import 'package:ngopay/douyin/page/player/douyin_player.dart';
import 'package:ngopay/douyin/page/player/like_gesture_widget.dart';
import 'package:ngopay/douyin/page/player/vinyl_disk.dart';
import 'package:ngopay/douyin/page/home/widget/comment_widget.dart';

/// @author jd
/// 推荐

class DouyinHomeRecommendPage extends StatefulWidget {
  const DouyinHomeRecommendPage({required this.source});
  final String source; //来源
  @override
  _DouyinHomeRecommendPageState createState() =>
      _DouyinHomeRecommendPageState();
}

class _DouyinHomeRecommendPageState extends State<DouyinHomeRecommendPage>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  final List<Map<String, dynamic>> _list = [
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/296210754.hd.mp4?s=08c03c14c04f15d65901f25b542eb2305090a3d7\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_296210754',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/289258217.hd.mp4?s=5cf87d7670d96bbd2c110f4dc97fd5116f4468ad\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_289258217',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/236075858.hd.mp4?s=539faad12f040eb5afd8de3160db1220f1a5bac0\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_236075858',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/226685105.hd.mp4?s=b6a194faf216cac660ec198e72b4e939cd74dee3\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_226685105',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/330412624.hd.mp4?s=9a9c77ce40f703dcb023eca64c85e258195efa28\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_330412624',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/189545487.sd.mp4?s=8cd2af1ec08f7ce121a5a6a09c78c05237943524\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_189545487',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/370467553.hd.mp4?s=ce49c8c6d8e28a89298ffb4c53a2e842bdb11546\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_370467553',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/269971860.hd.mp4?s=eae965838585cc8342bb5d5253d06a52b2415570\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_269971860',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/214503838.sd.mp4?s=0aac7d3caa1d5eedbd97234814b1ca37904b71b2\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_214503838',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/294394804.hd.mp4?s=d8437c0fc1b6b8bf04089697cb0d68bd7072e9b1\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_294394804',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/299968768.hd.mp4?s=2103894c3fb2e0538a00cf1dea3ceb36ce494763\u0026profile_id=169\u0026oauth2_token_id=57447761',
      'author_name': 'JD_299968768',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/328428416.sd.mp4?s=39df9f60fdeaeff0f4e3fbf3c1213d395792fc43\u0026profile_id=165\u0026oauth2_token_id=57447761',
      'author_name': 'JD_328428416',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/459389137.hd.mp4?s=964e360f6996936b708905b2fcf9bdd66c26de0d\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_459389137',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/309448537.sd.mp4?s=48b017844b9c4f1758ac43b944e5d39ffd50bc2c\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_309448537',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/517090081.sd.mp4?s=ee697395679ffeb176703b481af4395a8ca5ff1a\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_517090081',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/534342299.hd.mp4?s=cf23e96b1691995d1b710d46f7cdd8387013e941\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_534342299',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/308040576.hd.mp4?s=d340327751fd571e1bcf209b379be91265a51e55\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_308040576',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/214483277.hd.mp4?s=a44eb4404b3df9e88dab5ad083ff79b47ed2c7db\u0026profile_id=119\u0026oauth2_token_id=57447761',
      'author_name': 'JD_214483277',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/363625327.hd.mp4?s=a283f7b8f1d1ed97cbb8fc90b871902f3a1e74d1\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_363625327',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/297927791.sd.mp4?s=5ceeec8c83fcb634312c157cc101b8bd19969b61\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_297927791',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/305250673.hd.mp4?s=8693586ed395358872da0c5be41267564e38ede4\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_305250673',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/342177837.sd.mp4?s=d3d03805e3c00a503ddc6b1832b2219de7eba472\u0026profile_id=139\u0026oauth2_token_id=57447761',
      'author_name': 'JD_342177837',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/456560647.hd.mp4?s=b31ff2714e104b0dec099fc79f2dcf7712057b6c\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_456560647',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/291648067.sd.mp4?s=7f9ee1f8ec1e5376027e4a6d1d05d5738b2fbb29\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_291648067',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/188557098.hd.mp4?s=911c1c900d991c43cec89ed87bd2578ca7060d4c\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_188557098',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/316506213.hd.mp4?s=1e169a0741d406dc6ff688d22a97cbeaf0261463\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_316506213',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/363629595.sd.mp4?s=19833f256b35b09e6c085309ad4e0df302004f1c\u0026profile_id=139\u0026oauth2_token_id=57447761',
      'author_name': 'JD_363629595',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/308162286.sd.mp4?s=97818dc6073e54de63fa233a5eb8a77bc5ad3dd4\u0026profile_id=164\u0026oauth2_token_id=57447761',
      'author_name': 'JD_308162286',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/224889044.hd.mp4?s=5945fd704bbe111e61f18c65432a9fac117c7f47\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_224889044',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/221214113.hd.mp4?s=61cb1f00c358f6e676bcde39e209d36fc924569a\u0026profile_id=119\u0026oauth2_token_id=57447761',
      'author_name': 'JD_221214113',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/328427476.hd.mp4?s=ddd13e964fd6c13d9b61cc52513a545533ad1c02\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_328427476',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/368320203.hd.mp4?s=ed62dd31538d7ef092250598fdb13c3cd0857812\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_368320203',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/222141051.hd.mp4?s=6bef23a63f93006c03d32848ad734f23039ba23a\u0026profile_id=172\u0026oauth2_token_id=57447761',
      'author_name': 'JD_222141051',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/310438775.hd.mp4?s=2ffe0ba9beae4f3dee6348a0923c6a360696a03e\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_310438775',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/284652268.hd.mp4?s=83bf020202ed20212d391c67daec2d21940b4115\u0026profile_id=172\u0026oauth2_token_id=57447761',
      'author_name': 'JD_284652268',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/363738503.hd.mp4?s=a7428ffaa309df7ac7399eafb59455f256d5c170\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_363738503',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/240636612.hd.?s=3a72fdb08cf0a1c3d8e3d38fce50ecd9d1bafe60\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_240636612',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/408412129.hd.mp4?s=0dc8c5e810d75a1e02e8fc908cb199be129260d3\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_408412129',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/354503796.sd.mp4?s=35aa1cdac528ebadf9e012d439ede3a2ace58253\u0026profile_id=165\u0026oauth2_token_id=57447761',
      'author_name': 'JD_354503796',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/350241088.hd.mp4?s=3a287426e0146dab6ea738f4629c6f0989a89603\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_350241088',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/308153460.hd.mp4?s=bb1572aa5b9a3dbc84d27e38bc2b46b4403a7505\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_308153460',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/386196793.hd.mp4?s=88b1d9862ae4484b6d2c6ebf485745aaa10c7a40\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_386196793',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/347584603.hd.mp4?s=d2c2f7efd23aa313f8637f31b0d3bda89918c7dc\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_347584603',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/378622071.hd.mp4?s=ad08dd62db24308b4339e589dba8e1650d17cf39\u0026profile_id=175\u0026oauth2_token_id=57447761',
      'author_name': 'JD_378622071',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/456191726.hd.mp4?s=3181ac327ec62d8778b6f7e88a0752e3fe0f1405\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_456191726',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/188556988.hd.mp4?s=106d9a5c0f8e447266a80368c25e2fb704479fdc\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_188556988',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/310303556.hd.mp4?s=f72311e180d6aac426bc5d5cfc9b935159d0d1a9\u0026profile_id=170\u0026oauth2_token_id=57447761',
      'author_name': 'JD_310303556',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/419878447.sd.mp4?s=13b30563e8e1388676f49494538575629ca3f042\u0026profile_id=165\u0026oauth2_token_id=57447761',
      'author_name': 'JD_419878447',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/210741501.sd.mp4?s=84a009996174d973f368059f7e8e713ff1162cca\u0026profile_id=165\u0026oauth2_token_id=57447761',
      'author_name': 'JD_210741501',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://player.vimeo.com/external/269975626.hd.mp4?s=f0c443da2bcde4d6dc18083b5a49d36d9929bfd3\u0026profile_id=174\u0026oauth2_token_id=57447761',
      'author_name': 'JD_269975626',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://storage.coverr.co/videos/pFOMR6ZWSMIr022Ez02A6USk6n01UFEzJKX?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjY1NTcwMDMyfQ.9Vr3UzJJZtoS0jyDv7D3dmjSZnwvu8BjPiNgM9vDfW8',
      'author_name': 'JD_1',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://storage.coverr.co/videos/Oy02bYMJ48PG2JQgjUaj29Ap9Lq02oop4f?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjY1NTcwMDMyfQ.9Vr3UzJJZtoS0jyDv7D3dmjSZnwvu8BjPiNgM9vDfW8',
      'author_name': 'JD_2',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://storage.coverr.co/videos/AgrvSYdrjjwF6J1y5jR8k02SjW54crgY2?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjY1NTcwMDMyfQ.9Vr3UzJJZtoS0jyDv7D3dmjSZnwvu8BjPiNgM9vDfW8',
      'author_name': 'JD_3',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://storage.coverr.co/videos/6zgmbDvFt43okqxBHcOjcb4MOFJ02qwx4?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjY1NTcwMDMyfQ.9Vr3UzJJZtoS0jyDv7D3dmjSZnwvu8BjPiNgM9vDfW8',
      'author_name': 'JD_4',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://storage.coverr.co/videos/3UK2eBVFLrMeORd00JvDJINJTgkINbSKI?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjY1NTcwMDMyfQ.9Vr3UzJJZtoS0jyDv7D3dmjSZnwvu8BjPiNgM9vDfW8',
      'author_name': 'JD_5',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
    <String, dynamic>{
      'video_url':
          'https://storage.coverr.co/videos/2K02sI8YJh7IcyYnyh63VUE002Dhbavain?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjY1NTcwMDMyfQ.9Vr3UzJJZtoS0jyDv7D3dmjSZnwvu8BjPiNgM9vDfW8',
      'author_name': 'JD_6',
      'content': '广告收入、停车位收入、物业管理用房经营收入等都归业主所有，几乎每个小区都有，你拿到了吗？#苏州',
      'source': '@浙有正能量创作的原创',
    },
  ];

  final int _currentIndex = 0;
  late List<DouyinPlayerController> _pageControllerList;

  @override
  void initState() {
    _pageControllerList = List.generate(
      _list.length,
      (index) => DouyinPlayerController(
        url: _list[index]['video_url'].toString(),
        isPlaying: index == 0,
      ),
    ).toList();
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _pageControllerList) {
      element.dispose();
    }
    _pageControllerList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LikeGestureWidget(
      onAddFavorite: () {
        debugPrint('我在双击');
      },
      onSingleTap: () {
        debugPrint('我在单击');
      },
      child: PageViewLifecycleWrapper(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _list.length,
          controller: _pageController,
          // allowImplicitScrolling: true,
          // dragStartBehavior: DragStartBehavior.down,
          onPageChanged: (int index) {
            // print('index:$index');
            // DouyinPlayerController preController =
            //     _pageControllerList[_currentIndex];
            // DouyinPlayerController currentController =
            //     _pageControllerList[index];
            // preController.pause();
            // currentController.play();
            // _currentIndex = index;
          },
          // layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            return ChildPageLifecycleWrapper(
              wantKeepAlive: true,
              index: index,
              child: _buildPage(index),
            );
          },
        ),
      ),
    );
  }

  ///页面布局
  Widget _buildPage(int index) {
    final Map item = _list[index];
    final douyinPlayerController = _pageControllerList[index];
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          _buildPlayer(item, douyinPlayerController),
          _buildRightMenu(item),
          _buildBottom(item),
        ],
      ),
    );
  }

  ///播放器布局
  Widget _buildPlayer(Map item, DouyinPlayerController douyinPlayerController) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: DouyinPlayer(
        douyinPlayerController: douyinPlayerController,
        source: widget.source,
      ),
    );
  }

  ///播放器上面的右侧菜单
  Widget _buildRightMenu(Map item) {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          debugPrint('right');
        },
        child: SizedBox(
          width: 80,
          height: 300,
          child: Column(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  debugPrint('add');
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {
                  debugPrint('favorite');
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              IconButton(
                icon: const Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                onPressed: () {
                  debugPrint('comment');
                  _commentAction();
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              IconButton(
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {
                  debugPrint('share');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///播放器上面的底部信息布局
  Widget _buildBottom(Map item) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        // margin: const EdgeInsets.only(bottom: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          NavigationUtil.push(DouyinPeopleDetailPage());
                        },
                        child: Text(
                          item['author_name'].toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        item['content'].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      height: 30,
                      // color: Colors.red,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['source'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: Container(
                              height: 25,
                              margin: const EdgeInsets.only(left: 10),
                              child: Marquee(
                                text: '隐形的翅膀-张韶涵',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   width: 50,
            //   alignment: Alignment.bottomRight,
            //   child: VinylDisk(AssetBundleUtils.getImgPath('user_head_0')),
            // ),
          ],
        ),
      ),
    );
  }

  ///评论点击
  void _commentAction() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return CommentWidget();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
