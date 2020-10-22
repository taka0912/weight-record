import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/my_page_notifire.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'my_page_notifier.dart';

class MyPage extends StatelessWidget {
  const MyPage._({Key key}) : super(key: key);

  static Widget wrapped(){
    return MultiProvider(
      providers: [
        StateNotifierProvider<MyPageNotifier, MyPageState>(
          create: (context) => MyPageNotifier(
            context: context,
          ),
        )
      ],
      child: const MyPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MyPageNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text('体重記録アプリ'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100.0,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 26),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(10, 10),
                  ),
                ],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Builder(
                   builder: (BuildContext context) {
                   final count = context.select((MyPageState state) => state.count);
                   return Container(
                        padding: EdgeInsets.only(left: 12),
                        width: 100,
                        child: Text(
                          count.toString(),
                          style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                    );
                   },
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Icon(Icons.calendar_today),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '2020/10/22',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              child: Icon(Icons.comment),
                            ),
                            SizedBox(width: 8),
                            Text('努力が必要')
                          ],
                        )
                      ],
                    ),
                  ),

                Text('今日の体重を追加しよう'),
                IconButton(
                 icon: Icon(
                 Icons.add_circle,
                 color: Colors.blue,
              ),
              onPressed: () {
                notifier.pushButton();
              },
            )
           ],
          ),
         ),
        ]
      ),
     ),
    );
  }
}

