import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizstar/quizpage.dart';
// import 'package:device_preview/device_preview.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/toan.png",
    "images/vatly.png",
    "images/hoahoc.png",
    "images/tienganh.png",
    "images/sinhhoc.png",
  ];

  List<String> des = [
    "Để tăng tốc khả năng tính toán , hãy chuẩn bị sẵn máy tính và giấy bút cùng một cái đầu lạnh.\nLưu ý: Mỗi câu hỏi chỉ có 30 giây nên hãy cố gắng !",
    "Vật lý là một môn học không khó mà cũng không dễ dàng\nHãy nắm chắc kiến thức trong đầu và máy tính CASIO trên tay để bước vào bài thi",
    "Hóa học là môn học đòi hỏi tư duy cao và phản xạ nhanh, linh hoạt.\n Hãy chuẩn bị sẵn combo bảng tuần hoàn + máy tính + giấy nháp để sẵn sàng bước vào những câu hỏi đầu tiên nào!",
    "Tiếng Anh là ngôn ngữ phổ biến nhất thế giới nên việc học Tiếng Anh là rất cần thiết cho tương lai mỗi người",
    "Sinh học là môn học khá khó học với một số bạn nhưng nếu các bạn tìm hiểu và mầy mò học hỏi tìm tòi thì có thế các bạn sẽ yêu môn học này đó",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(                //căn lề khoảng cách
      padding: EdgeInsets.symmetric(
        vertical: 20.0,             //căn lề trên dưới
        horizontal: 30.0,            //căn lề hai bên
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file 
            // for a particular language
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 50.0,         //đổ bóng
          borderRadius: BorderRadius.circular(50.0),    //bo cong viền
          child: Container(
            child: Column(
              children: <Widget>[

                SizedBox(width: 20, height: 10),

                Padding(                             //căn lề khoảng cách
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,                     //căn trên trên dưới
                    // horizontal:             // căn 2 bên

                  ),
                  child: Material(
                    elevation: 15.0, //đổ bóng
                    borderRadius: BorderRadius.circular(100.0),    //bo cong Material 100% THÀNH HÌNH TRÒN
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,   // chiều dài khung ảnh Material
                      width: 150.0,     //chiều rộng khung Material
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,   // auto fit ảnh vừa
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrange,
      //
      //   title: Text(
      //     "ÔN LUYỆN THI THPT QUỐC GIA",
      //     style: TextStyle(
      //       fontFamily: "Quando",
      //       fontSize: 20
      //     ),
      //   ),
      // ),





      // body: ListView(
      //   children: <Widget>[

        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/nen.png'),
                fit: BoxFit.cover,
              ),
            ),

         child: SingleChildScrollView(
           padding: const EdgeInsets.all(8),
           scrollDirection: Axis.vertical,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[


      // Image.asset('assets/logo.png', width: 200,height: 160),


      SizedBox(width: 20, height: 40),
      const Text(
        "Cùng UTT ôn thi THPT quốc gia !!",
        style: TextStyle(
          fontSize: 49.0,
          color: Colors.deepOrange,
          fontFamily: "Satisfy",
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(width: 20, height: 20),
      // const Text(
      //   "Lưu ý: Mỗi lần thi sẽ bao gồm 20 câu hỏi, mỗi câu hỏi có 30 giây để chọn ứng với mỗi đáp án là 5 điểm, nếu hết thời gian thí sinh không chọn đáp án thì câu hỏi đó sẽ không tính điểm !",
      //   style: TextStyle(
      //     fontSize: 16,
      //     // fontWeight: FontWeight.bold,
      //     color: Colors.black,
      //     fontFamily: "Roboto",
      //   ),
      //   textAlign: TextAlign.center,
      // ),

          customcard("Toán học", images[0], des[0]),
          customcard("Vật lý", images[1], des[1]),
          customcard("Hóa học", images[2], des[2]),
          customcard("Tiếng Anh", images[3], des[3]),
          customcard("Sinh học", images[4], des[4]),
      // const Text(
      //   "Nếu bạn có thắc mắc hay bất kỳ câu hỏi gì về ứng dụng hãy liên hệ đến số điện thoại 0904892301 để được tiếp nhận đóng góp phát triển ứng dụng",
      //   style: TextStyle(
      //       fontSize: 17.0,
      //       color: Colors.black87,
      //       fontFamily: "quando",
      //       fontWeight: FontWeight.bold
      //   ),
      //   textAlign: TextAlign.center,
      // ),
        ],
      ),
    )),


        // floatingActionButton: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       FloatingActionButton(
        //         onPressed: () => {},
        //         child: Icon(Icons.navigate_before_rounded),
        //         heroTag: "fab1",
        //       ),
        //       FloatingActionButton(
        //         onPressed: () => {},
        //         child: Icon(Icons.navigate_next_rounded),
        //         heroTag: "fab2",
        //       ),
        //     ]
        // )

      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.orange,
        // nút đứng im 1 góc
      onPressed: (){
        showAlertDialog(context);   //showAlertDialog chỉ là tên
      },
      tooltip: 'Increment', //có thể bỏ
      child: const Icon(Icons.announcement_outlined,),
    ),

    );
  }



  showAlertDialog(BuildContext context) {

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
      title: Text("Lưu ý:"),
      content: Text("Mỗi lần thi sẽ bao gồm 20 câu hỏi .\nMỗi câu hỏi có 30 giây để chọn ứng với mỗi đáp án là 5 điểm.\nNếu hết thời gian thí sinh không chọn đáp án thì câu hỏi đó sẽ không tính điểm !",
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