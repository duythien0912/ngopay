import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngopay/douyin/utils/toast_utils.dart';
import 'package:ngopay/douyin/utils/asset_bundle_utils.dart';

import 'package:ngopay/douyin/widgets/direction_button.dart';
import 'package:ngopay/douyin/widgets/input/input_message_widget.dart';

/// @author jd
///

class Comment {
  Comment({this.icon, this.name, this.content, this.commentCount, this.time});
  final String? icon;
  final String? name;
  final String? content;
  final String? time;
  final int? commentCount;
}

class CommentWidget extends StatefulWidget {
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  List<Comment> messageList = [];
  List<String> comment = [
    '一开始的说的是谁啊',
    '一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊',
    '一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊',
    '赞',
    '一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊一开始的说的是谁啊',
  ];

  final List<String> _selectList = [
    '淫秽色情',
    '营销广告',
    '恶意谩骂',
    '违法信息',
    '虚假谣言',
    '不想看此评论',
  ];
  final Map<String, bool> _selectListValue = {};

  @override
  void initState() {
    messageList = List<Comment>.generate(
      50,
      (index) => Comment(
        icon: AssetBundleUtils.getImgPath('ali_connors'),
        name: '你永远得不到的人',
        content: comment[index % 5],
        commentCount: index,
        time: '2021-01-01 01:02:$index',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _navigation(),
          const Divider(
            height: 1,
          ),
          Expanded(child: _list()),
        ],
      ),
    );
  }

  Widget _navigation() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },),
          const Expanded(
            child: Center(
              child: Text('4条评论'),
            ),
          ),
          const SizedBox(
            width: 60,
          ),
        ],
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (c, index) {
          return _buildItem(messageList[index]);
        },);
  }

  Widget _buildItem(Comment commnet) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // color: Colors.red,
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  commnet.icon ?? '',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commnet.name ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(commnet.content ?? ''),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black.withAlpha(150), backgroundColor: Colors.grey[100],
                            textStyle: const TextStyle(
                              fontSize: 12,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            ToastUtils.toast('点我干嘛?');
                            showInputMessage(context);
                          },
                          child: const Text('回复'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            commnet.time ?? '',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 55,
              // color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DirectionButton(
                    action: () {
                      ToastUtils.toast('点我干嘛?');
                    },
                    icon: const Icon(Icons.thumb_up_alt_outlined),
                    text: const Text('4'),
                    middlePadding: 8,
                    imageDirection: AxisDirection.right,
                  ),
                  Container(
                    // color: Colors.blue,
                    child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: _showDialog,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    for (var element in _selectList) {
      _selectListValue[element] = false;
    }
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              '举报',
              textAlign: TextAlign.center,
            ),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: _selectList.length * 40.0 + 100.0,
                  child: ListView.separated(
                      itemBuilder: (c, idx) {
                        return CheckboxListTile(
                            value: _selectListValue[_selectList[idx]],
                            title: Text(_selectList[idx]),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (isCheck) {
                              setState(() {
                                _selectListValue[_selectList[idx]] =
                                    !_selectListValue[_selectList[idx]]!;
                              });
                            },);
                      },
                      separatorBuilder: (c, idx) {
                        return const Divider(
                          height: 0.5,
                          color: Colors.grey,
                        );
                      },
                      itemCount: _selectList.length,),
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  var v = '';
                  _selectListValue.forEach((key, value) {
                    if (value) {
                      v += key;
                      v += ',';
                    }
                  });
                  ToastUtils.toast('已选中:$v 准备上传！');
                  Navigator.of(context).pop();
                },
                child: const Text('确认'),
              ),
            ],
          );
        },);
  }
}
