import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webapi/models/covid_model.dart';
import 'dart:convert';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  //การเรียกใช้ Model CovidModel
  CovidModel _dataCovidApi;

  //สร้าง method ทดสอบโหลดข้อมูลจาก api
  Future<void> getData() async{
    var url = "https://covid19.ddc.moph.go.th/api/Cases/today-cases-all";
    try{
      var response = await http.get(url);
      print(response.statusCode);
      print(response.body.runtimeType);
      print(response.body);
      // ทำการ SetState ข้อมูล
      setState(() {
        _dataCovidApi = covidModelFromJson(response.body);
      });

    }catch(error){
      print(error);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'ติดเชื้อสะสม',
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            Text('${_dataCovidApi}'),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'เสียชีวิต',
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            Text("2222"),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:24.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'หายแล้ว',
                                style: TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                              Text("3333"),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'รักษาอยู่',
                                style: TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                              Text("4444"),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'รายใหม่',
                                style: TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                              Text("5555"),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )
              ),
              child: Column(
                children: <Widget>[
                  // BarChartPage()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


