import 'package:fifty_whys_to_ditch_porn/models/reasons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../utils/layout.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fifty_whys_to_ditch_porn/widgets/spring_button.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Reasons> myreasons;
  Color _selectedColor;
  Reasons _selectedReasons;

  void initState() {
    super.initState();
   
    _fetchReasons();
  }

  _fetchReasons() async {
    final reasonsJason = await rootBundle.loadString('assets/reasons.json');
    myreasons = ReasonsList.fromJson(reasonsJason).reasons;
    print('=============>' + myreasons.length.toString());
     _selectedColor = Color(int.tryParse(myreasons[0].color));
    _selectedReasons = myreasons[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        Container(
          width: screenWidth(context),
          height: screenHeight(context, percent: 0.4),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://image.freepik.com/free-vector/woman-with-duct-tape-mouth-price-tag-being-trafficked-sexually-exploited-sex-trafficking-human-trafficking-criminal-businesses-concept_335657-217.jpg")),
          ),
        ),
        Container(
          width: screenWidth(context),
          height: screenHeight(context, percent: 0.4),
          decoration: BoxDecoration(color: Colors.black26),
        ),

        myreasons != null
            ? Align(
                alignment: Alignment.center,
                child: VxSwiper.builder(
                    height: screenHeight(context, percent: 0.80),
                    enlargeCenterPage: true,
                    itemCount: myreasons.length,
                    aspectRatio: 2.0,
                    onPageChanged: (index) {
                      //set the  reason to the swiper index
                      _selectedReasons = myreasons[index];
                      final color = Color(int.tryParse(myreasons[index].color));
                      _selectedColor = color;
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      final _thisReasons = myreasons[index];
                      return Container(
                        // height: screenHeight(context),
                        height: screenHeight(context, percent: 0.8),

                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 20, top: 4),
                          child: Container(
                            // width: screenWidth(context),
                            height: screenHeight(context, percent: 0.8),

                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(200),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: -7,
                                    offset: Offset(0, 10),
                                    color: Colors.grey.withOpacity(0.25),
                                    blurRadius: 20,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(18),
                                    title: Text(
                                      _thisReasons.title ?? 'No Title',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 0.5),
                                      child: ListView(
                                        scrollDirection: Axis.vertical,
                                        children: <Widget>[
                                          Text(
                                            _thisReasons.desc ?? 'No Content',
                                            style: TextStyle(
                                                height: 1.4,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            : Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.purple),
                  ),
                ),
              ),
        //top back arrow
        SafeArea(
            child: Row(children: <Widget>[
          XMargin(10),
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Text(
            _selectedReasons.id.toString() ?? '1',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 40,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(FluentIcons.share_android_20_regular),
            color: Colors.white,
            onPressed: () {},
          ),
        ])),

        //stack closes
      ],
      fit: StackFit.loose,
    ));
  }
}
