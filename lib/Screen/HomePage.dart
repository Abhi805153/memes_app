import 'package:flutter/material.dart';
import 'package:memes_app/controller/SaveMydata.dart';
import 'package:memes_app/controller/fetchmeme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imgUrl = "";
  int? memeNo;
  bool isLoading = true;
  int targetMeme = 10;

  @override
  void initState() {
    super.initState();
    GetInitMemeNo();
    UpdateImg();
  }

  GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData()??0;
    if(memeNo !> 10){
      targetMeme = 100;
    }else if (memeNo !> 100){
      targetMeme =500;
    }
    setState(() {});
  }

  void UpdateImg() async {
    String getImgUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  "Meme #${memeNo.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 45,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Target ${targetMeme} Memes",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                isLoading
                    ? Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            height: 60,
                            width: 60,
                          ),
                        ),
                      )
                    : Image.network(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                  imgUrl,
                      ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    UpdateImg();
                    await SaveMyData.saveData(memeNo! + 1);
                    GetInitMemeNo();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 150,
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Created By ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Abhimanyu Sah",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
