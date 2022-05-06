import 'package:flutter/material.dart';
import 'package:quizstar/home.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 40) {
      image = images[2];
      message =
          "Bạn nên cố gắng hơn\n" + "Điểm của bạn là $marks trên 100 điểm";
    } else if (marks < 70) {
      image = images[1];
      message =
          "Bạn có thể làm tốt hơn\n" + "Điểm của bạn là $marks trên 100 điểm";
    } else {
      image = images[0];
      message =
          "Kết quả của bạn thật xuất sắc\n" + "Điểm của bạn là $marks trên 100 điểm";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Center(
        child:Text(
          "Kết quả",
          // textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,fontFamily: "Satisfy",),
        ),
        ) ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Material(
              elevation: 15.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20, height: 50),

                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Quando",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // OutlineButton(
                //
                //   onPressed: () {
                //     Future.delayed(Duration(seconds: 4),
                //             () =>
                //                 Navigator.of(context).pushReplacement(MaterialPageRoute(
                //       builder: (context) => homepage(),
                //     )));
                //
                //
                //    // Navigator.of(context).popUntil((route) => route.isFirst); // ko hoạt động
                //
                //
                //     final snackBar = SnackBar(
                //       content: const Text('Nếu kết quả chưa được tốt hãy cố gắng vào lần sau 🤗', style: TextStyle(fontSize: 13.5)),
                //
                //       behavior: SnackBarBehavior.floating,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(24),
                //       ),
                //       backgroundColor: Colors.blue,
                //     );
                //     ScaffoldMessenger.of(context)
                //         .showSnackBar(snackBar);
                //   },
                //   // child: Text(
                //   //   "Continue",
                //   //   style: TextStyle(
                //   //     fontSize: 18.0,
                //   //   ),
                //   // ),
                //   child: Icon(Icons.home,size: 40,),
                //   padding: EdgeInsets.symmetric(
                //     vertical: 5.0,
                //     horizontal: 35.0,
                //
                //
                //   ),
                //   borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                //   splashColor: Colors.indigoAccent,
                //
                //
                //
                // )
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 120,
                        height: 45,
                        color: Colors.orangeAccent,
                        child: TextButton(
                          child: const Text('Xem lại kết quả'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.amber,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            showAlertDialog1(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20,width: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 120,
                        height: 45,
                        color: Colors.orangeAccent,
                        child: TextButton(
                          child: const Text('TRANG CHỦ'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.lightBlueAccent,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            Future.delayed(Duration(seconds: 4),
                                    () =>
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => homepage(),
                                    )));


                            // Navigator.of(context).popUntil((route) => route.isFirst); // ko hoạt động


                            final snackBar = SnackBar(
                              content: const Text('Nếu kết quả chưa được tốt hãy cố gắng vào lần sau 🤗', style: TextStyle(fontSize: 13.5)),

                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              backgroundColor: Colors.blue,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  showAlertDialog1(BuildContext context) {

    // cài button
    Widget okButton = TextButton(
      child: Text("OK",
        style: TextStyle(fontSize: 15),),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // thiết kế AlertDialog - bảng thông báo
    AlertDialog alert = AlertDialog(
      // title: Text("Lưu ý:"),
      content: Text("Tính năng đang được thử nghiệm",
        style: TextStyle(
          fontSize: 17,
          // fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: "Roboto",
        ),),
      actions: [
        okButton,
      ],

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
