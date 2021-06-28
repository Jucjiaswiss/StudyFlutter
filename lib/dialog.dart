import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: new DialogTest(),
    );
  }
}

void showAlertDialog(BuildContext context,Widget contentWidget){
  showDialog(context: context,
      builder:(BuildContext context){
      return new AlertDialog(
        title: null,
        insetPadding: EdgeInsets.zero, //dialog设置了默认大小280px 这里改为全屏显示，如果dialog很小，用UnconstrainedBox和SizedBox嵌套
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        content: contentWidget,
        actions: <Widget>[],
      );
      },
  );
}

class DialogTest extends StatefulWidget {
  @override
  createState() => new DialogTestState();
}

Widget _genUpgradePopupWindow(BuildContext context) {
  return new Stack(alignment: Alignment.topCenter, children: [
    Container(
      alignment: Alignment.center,
      height: 390,
      width: 370,
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.center,
            height: 330,
            width: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              border: new Border.all(width: 2, color: Colors.white),
            ),
            child: Column(
              children: [
                Container(
                  height: 255,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 60),
                  child: Text("版本更新啦！优化体验，立即更新",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      )),
                ),
                Divider(height: 1, color: Colors.black26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 182,
                      height: 70,
                      child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pop(true); //关闭对
                        },
                        autofocus: true,
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                          foregroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            return Colors.black;
                          }),
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.green[200];
                            }
                            return null;
                          }),
                        ),
                        child: Text("忽略"),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                      height: 70,
                      child: Container(
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(
                      width: 182,
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); //关闭对
                        },
                        autofocus: true,
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                          foregroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            return Colors.green;
                          }),
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.green[200];
                            }
                            return null;
                          }),
                        ),
                        child: Text("升级"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      alignment: Alignment.center,
      height: 100,
      width: 100,
      color: null,
      child: Image.asset(
        'assets/img/a.png',
      ),
    ),
  ]);
}

Widget _genAgreementPopupWindow(BuildContext context) {
  return new Container(
    alignment: Alignment.center,
    height: 510,
    width: 370,
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      border: new Border.all(width: 2, color: Colors.white),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 70,
          alignment: Alignment.center,
          // padding: EdgeInsets.only(top: 60),
          // color: Colors.yellow,
          child: Text("个人信息保护指引",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15,left: 30,right: 30),
          child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child:
                Text("请充分阅读并理解：",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text("《用户协议》",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text("及",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text("《隐私政策》",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ],
              )
            ),
            Text("1、安全可靠：我们竭尽全力通过合理有效的信息安全技术及管理流程，防止您的信息泄露、损毁、丢失。\n2、自主选择：我们为您提供便利的信息管理选项，以便您做出合适的选择，管理您的个人信息。\n3、保护通信秘密：我们严格遵照法律法规，保护您的通信秘密，为您提供安全的通信服务。",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                )
            ),
          ],
          )
        ),
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),// 渐变色
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); //关闭对
            },
            autofocus: true,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              foregroundColor:
              MaterialStateProperty.all(Colors.white),
              backgroundColor:
              MaterialStateProperty.all(null),
            ),
            child: Text("同意"),
          ),
        ),
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),// 渐变色
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); //关闭对
            },
            autofocus: true,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              foregroundColor:
              MaterialStateProperty.all(Colors.grey[400]),
              backgroundColor:
              MaterialStateProperty.all(Colors.white),
            ),
            child: Text("不同意"),
          ),
        ),
      ],
    ),
  );
}

Widget _genAuthorityPopupWindow(BuildContext context) {
  return new Stack(alignment: Alignment.topCenter, children: [
    Container(
      alignment: Alignment.center,
      height: 380,
      width: 370,
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(16.0),topRight:Radius.circular(16.0)),
                border: new Border.all(width: 2, color: Colors.indigo),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 220,
            width: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16.0),bottomRight:Radius.circular(16.0)),
              border: new Border.all(width: 2, color: Colors.white),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 70,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(top: 60),
                  // color: Colors.yellow,
                  child: Text("您还未打开系统消息推送",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  // color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("打开消息通知获得实时消息和推送通知",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                        letterSpacing: 1.0,
                      )),
                ),
                SizedBox(
                  width: 320,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); //关闭对
                    },
                    autofocus: true,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      foregroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue;
                        }
                        return Colors.white;
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue[200];
                        }
                        return Colors.blue;
                      }),
                    ),
                    child: Text("立即开启"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      height: 200,
      width: 200,
      color: null,
      child: Image.asset(
        'assets/img/b.png',
      ),
    ),
    new Positioned(
      right: 8.0,
      child:new IconButton(
          icon: new Icon(Icons.clear),
          iconSize: 40,
          color: Colors.white,
          alignment: Alignment.topRight,
          onPressed: (){
            Navigator.of(context).pop(true); //关闭对
          }
      ),
    ),
  ]);
}

class DialogTestState extends State<DialogTest> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dialog Test'),
        ),
        body: Column(children: [
          new Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 46, vertical: 18),
            alignment: Alignment.center,
            child: Row(children: [
              TextButton(
                onPressed: () {
                  showAlertDialog(context, _genUpgradePopupWindow(context));
                },
                child: Text("更新弹窗"),
              ),
              TextButton(
                onPressed: () {
                  showAlertDialog(context, _genAgreementPopupWindow(context));
                },
                child: Text("协议弹窗"),
              ),
              TextButton(
                onPressed: () {
                  showAlertDialog(context, _genAuthorityPopupWindow(context));
                },
                child: Text("权限弹窗"),
              ),
            ]),
          ),
        ]));
  }
}
