import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:emoji_can/foodpage.dart';
import 'package:emoji_can/foodtabs.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/user.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'SEARCH  FOR  YOUR',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'FOVORITE  FOOD',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.lato(fontSize: 18.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommendation',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem(
                  'Burger',
                  'assets/burger.png',
                  '7',
                  Color(0xFFFFE0B2),
                  Color(0xFF000000),
                ),
                _buildListItem(
                  'Cake',
                  'assets/cake.png',
                  '15',
                  Color(0xFFB3E5FC),
                  Color(0xFF000000),
                ),
                _buildListItem(
                  'Sandwich',
                  'assets/sandwich.png',
                  '7',
                  Color(0xFF80CBC4),
                  Color(0xFF000000),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.lato(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.lato(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
              ),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(
    String foodName,
    String imgPath,
    String price,
    Color bgColor,
    Color textColor,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodPage(
                heroTag: foodName,
                foodName: foodName,
                itemPrice: price,
                imgPath: imgPath,
              ),
            ),
          );
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height: 85.0,
                  width: 85.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                foodName,
                style: GoogleFonts.lato(
                  fontSize: 20.0,
                  color: textColor,
                ),
              ),
              Text(
                '\$' + price,
                style: GoogleFonts.lato(
                  fontSize: 18.0,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
