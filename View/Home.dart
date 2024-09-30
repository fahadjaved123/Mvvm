import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/Data/responce/Api_responce.dart';
import 'package:mvvm/Data/responce/Status.dart';
import 'package:mvvm/Model/Movies_list_Model.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:mvvm/Utitls/Utils.dart';
import 'package:mvvm/View_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../View_model/Home_view_model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final Map<String ,dynamic>map;
  TextEditingController textcon=TextEditingController();
  HomeviewviewModel homeviewviewModel=HomeviewviewModel();
  @override

  void initState() {
    // TODO: implement initState
    homeviewviewModel.FetchMoviesList();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    final sharedPrefferenc=Provider.of<UserviewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        backgroundColor: Colors.brown,
        title:  Text('Home'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              sharedPrefferenc.remove().then((value){
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
              child: Icon(Icons.logout)),
        ],

      ),
      drawer: Drawer(
        surfaceTintColor: Colors.yellow,
        width: 250,
        backgroundColor: Colors.grey.shade200,
        elevation: 2,
        child: ListView(
          children: [
            DrawerHeader(
                child:Center(child: Text('L O G O',style: TextStyle(fontSize: 50),)) ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('page 1'),
            ),
          ],
        ),
      ),
      body: ChangeNotifierProvider<HomeviewviewModel>(
          create: (BuildContext context)=>homeviewviewModel,
        child: Consumer<HomeviewviewModel>(builder: (context,value,_){
          switch (value.Usemodel.status) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            case Status.error:
              return Center(child: InkWell(
                onTap: (){
                  initState();
                },
                  child: Text(value.Usemodel.message.toString())));

            case Status.completed:
              return Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child:  SizedBox(
                  height: MediaQuery.of(context).size.height *1.0,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.30,
                          child: Pageveiw()),
                      SizedBox(height: 10,),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              mainAxisExtent: 270,
                            ),
                            shrinkWrap: true,
                            physics:ScrollPhysics(),
                            itemCount: value.Usemodel.data!.movies!
                                .length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        value.Usemodel.data!
                                            .movies![index]
                                            .posterurl.toString());
                                  }
                                },
                        
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius
                                        .circular(20),
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(3.0, 3.0),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                  ),
                        
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius
                                            .only(
                                          topLeft: Radius.circular(
                                              20),
                                          topRight: Radius.circular(
                                              20),
                                        ),
                                        child: Image.network(
                                          value.Usemodel.data!
                                              .movies![index]
                                              .posterurl.toString(),
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context,
                                              error, Stack) {
                                            return Padding(
                                              padding: const EdgeInsets
                                                  .only(top: 80),
                                              child: Icon(Icons
                                                  .error_outline,
                                                color: Colors.white,
                                                size: 50,),
                                            );
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          ' ${value.Usemodel.data!
                                              .movies![index].title
                                              .toString()
                                              .toUpperCase()}',),
                                        subtitle: Text(
                                          value.Usemodel.data!
                                              .movies![index].year
                                              .toString(),),
                                        trailing: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          mainAxisSize: MainAxisSize
                                              .min,
                                          children: [
                                            Text(
                                                Utils.averageRating(
                                                  value.Usemodel
                                                      .data!
                                                      .movies![index]
                                                      .ratings!,)
                                                    .toStringAsFixed(
                                                    1)),
                                            SizedBox(width: 5.0,),
                                            Icon(Icons.star,
                                              color: Colors.yellow,)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                        
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),

                // child: ListView.builder(
                //   itemCount: value.Usemodel.data!.movies!.length,
                //     itemBuilder: (context,index){
                //       return Card(
                //         child: ListTile(
                //           leading: Image.network(
                //               value.Usemodel.data!.movies![index].posterurl.toString(),
                //             errorBuilder: (context,error,stack){
                //                 return Icon(Icons.error_outline_sharp,color: Colors.red,size: 40,);
                //             },
                //             height: 50,
                //             width: 50,
                //             fit: BoxFit.cover,
                //           ),
                //           title: Text(value.Usemodel.data!.movies![index].title.toString()),
                //           subtitle: Text(value.Usemodel.data!.movies![index].year.toString()),
                //           trailing: Row(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Text(Utils.averageRating(value.Usemodel.data!.movies![index].ratings!).toStringAsFixed(1)),
                //               Icon(Icons.star,color: Colors.yellow,),
                //             ],
                //           ),
                //         ),
                //       );
                //     }),
              );
            default:
              return Text('Unknown status');
          }

          return Container();
        }),
      ),

    );
  }
}


class Pageveiw extends StatefulWidget {
  const Pageveiw({super.key});

  @override
  State<Pageveiw> createState() => _PageveiwState();
}

class _PageveiwState extends State<Pageveiw> {
  var _pagecontroller=PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );
  var PageNo=0;
  late final Timer carousaltimer;
  Timer gettime(){
    return Timer.periodic(Duration(seconds: 3), (timer){
      if(PageNo==4){
        PageNo=0;
      }
      _pagecontroller.animateToPage(PageNo,
          duration: Duration(seconds: 2), curve:Curves.decelerate);
      PageNo++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    //Carousal=gettime();
    carousaltimer=gettime();
    //gettime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *0.25,
            child: PageView.builder(
                controller: _pagecontroller,
                itemCount: 5,
                onPageChanged:(index){
                  PageNo=index;
                  setState(() {

                  });
                } ,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 36,left: 5,bottom: 10,right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),

                    ),
                  );
                }),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (int index){
                return Icon(Icons.circle,size: 10,
                  color: PageNo==index? Colors.indigoAccent:Colors.blue.shade300,);
              })
          ),
        ],
      ),
    );
  }
}


