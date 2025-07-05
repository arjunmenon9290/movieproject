import 'dart:math';

import 'package:examproject/app_bar.dart';
import 'package:examproject/bloc/movie_bloc.dart';
import 'package:examproject/view/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class firstpage extends StatelessWidget {
  firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    BlocProvider.of<MovieBloc>(context).add(getevent());
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: appbar_page(
                imagenetwork:
                    'https://as1.ftcdn.net/v2/jpg/03/60/06/66/1000_F_360066662_HP5c8JZZ2LnTkwrYR7You9P2kmE1dz4k.jpg',
                title: "Movie mania"),
            body:
                BlocBuilder<MovieBloc, MovieState>(builder: ((context, state) {
              if (state is dataloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is dataloaded) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Image.network(
                            'https://cdn.pixabay.com/photo/2022/04/08/16/37/playback-icon-7119874_1280.png',
                            width: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Trending Movies",
                            style: GoogleFonts.manrope(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.value.length,
                        itemBuilder: ((context, index) {
                          var data = state.value[index];
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              color: Color.fromARGB(255, 18, 18, 18),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              secondpage(id: data.imdbID)));
                                },
                                child: Image.network(data.imgurl),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: state.currentPage > 1
                              ? () {
                                  context.read<MovieBloc>().add(
                                      getevent(page: state.currentPage - 1));
                                }
                              : null,
                          child: Text(
                            "Previous",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Page ${state.currentPage}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            context
                                .read<MovieBloc>()
                                .add(getevent(page: state.currentPage + 1));
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ), // ⬅️ End of Row (Pagination buttons)

                    SizedBox(height: 10), // ⬅️ Space below buttons
                  ],
                ); // ⬅️ End of Column
              }

              if (state is dataerror) {
                return Center(
                  child: Text(e.toString()),
                );
              }
              return Center(
                child: Text("heloo"),
              );
            }))));
  }
}
