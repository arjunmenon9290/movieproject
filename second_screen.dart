import 'dart:math';

import 'package:examproject/bloc/movie_bloc.dart';
import 'package:examproject/view/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class secondpage extends StatefulWidget {
  secondpage({required this.id});
  String id;

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MovieBloc>(context).add(getmoviedetails(id: widget.id));
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => firstpage()),
        );
        return false;
      },
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        (context),
                        (MaterialPageRoute(builder: (((context) {
                          return firstpage();
                        })))),
                        (route) => false); // Pops the screen
                  },
                ),
                backgroundColor: Colors.red,
                title: Text(
                  "Movie details",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: BlocBuilder<MovieBloc, MovieState>(
                  builder: ((context, state) {
                if (state is dataloading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is moviedetailsdataloaded) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 49, 29, 29),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.network(state.value.imgurl),
                              ))),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: w * 0.8,
                          height: 200,
                          child: ListView(
                            children: [
                              Container(
                                  width: w * 0.8,
                                  height: h * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 49, 29, 29),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                      title: Text(
                                        "Title",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        state.value.title,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Container(
                                  width: w * 0.8,
                                  height: h * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 49, 29, 29),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                      title: Text(
                                        "Type",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        state.value.type,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Container(
                                  width: w * 0.8,
                                  height: h * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 49, 29, 29),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                      title: Text(
                                        "Year",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        state.value.year,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (state is dataerror) {
                  return Center(
                    child: Text(e.toString()),
                  );
                }
                return Text("heloo");
              })))),
    );
  }
}
