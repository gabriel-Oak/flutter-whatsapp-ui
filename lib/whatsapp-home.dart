import 'package:flutter/material.dart';

import 'pages/screens/screens.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
  with SingleTickerProviderStateMixin {

    TabController _tabController;
    static Icon _buttonIcon = Icon(Icons.message, color: Colors.white);

    @override
    void initState() {
      super.initState();
      _tabController = new TabController(vsync: this, initialIndex: 1, length: 4)
      ..addListener(() {
        setState(() {
          _buttonIcon = Icon(
            _tabController.index == 1 ? Icons.message :
            _tabController.index == 2 ? Icons.camera_alt :
            Icons.call, 
            color: Colors.white,
          );
        });
      });
    }
  
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width - 30;

    return Scaffold(
      appBar: new AppBar(
        title: Text('WhatsApp'),
        elevation: 0.7,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},            
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},            
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          tabs: [
            Container(
              width: 30,
              child: Tab(icon: Icon(Icons.camera_alt)),
            ),
            Container(
              width: (_width) / 4.5,
              child: Tab(text: 'CONVERSAS'),
            ),
            Container(
              width: (_width - 85) / 4.5,
              child: Tab(text: 'STATUS'),
            ),
            Container(
              width: (_width) / 4.5,
              child: Tab(text: 'CHAMADAS'),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallsScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: _buttonIcon,
        onPressed: () => print('opening chats'),
      ),
    );
  }
}
