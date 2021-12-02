import 'package:flutter/material.dart';
import 'package:flutter_webapi/screens/bottomnav/account/account_screen.dart';
import 'package:flutter_webapi/screens/bottomnav/home/home_screen.dart';
import 'package:flutter_webapi/screens/bottomnav/notification/notification_screen.dart';
import 'package:flutter_webapi/screens/bottomnav/report/report_screen.dart';
import 'package:flutter_webapi/screens/bottomnav/setting/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState(){
    _title = "หน้าหลัก";
    super.initState();
  }


  //สร้างตัวแปร List เก็บรายการที่ต้องการเปลี่ยนใน Bottom Navigator bar
  int _currentIndex = 0;
  String _title;
  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    AccountScreen()
  ];

  //สร้าง method สำหรับการเปลี่ยนหน้า
  void onTabTabped(int index){
    setState(() {
      _currentIndex = index;

      switch(index){
        case 0: _title = "หน้าหลัก";
          break;
        case 1:_title = "รายงาน";
          break;
        case 2: _title = "แจ้งเตือน";
          break;
        case 3: _title = "ตั้งค่า";
          break;
        case 4: _title = "ฉัน";
          break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),

      // ส่วนของ Drawer Menu
      drawer: SafeArea(
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: GestureDetector(
                    onTap: (){},
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://www.w3schools.com/w3images/avatar2.png"),
                    ),
                  ),
                  otherAccountsPictures: [
                    GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://www.w3schools.com/w3images/avatar6.png"),
                      ),
                    )
                  ],
                  accountName: Text("SN"),
                  accountEmail: Text("suwat@mail"),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://media.istockphoto.com/photos/dark-black-and-blue-grungy-wall-background-for-display-or-montage-of-picture-id1150477705?k=20&m=1150477705&s=612x612&w=0&h=Yrqw1w6bEJ40kZFTSovkLtu4VE52zLgl-n6AE1t2BuM="),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("เกี่ยวกับเรา"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text("ข้อมูลการใช้งาน"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/term');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text("ติดต่อทีมงาน"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/contact');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("ออกจากระบบ"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/start');
                  },
                ),
                Divider(color: Colors.green[200],),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text("ปิดเมนู"),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          )
      ),

      body: _children[_currentIndex],

      //  Bottom Navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTabped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("หน้าหลัก")),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), title: Text("รายงาน")),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text("แจ้งเตือน")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("ตั้งค่า") ),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("ฉัน")),
        ],
      ),
    );
  }
}
