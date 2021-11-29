import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbook/screens/bookingsheet.dart';
import '../models/movie.dart';
import '../models/theatre.dart';
import '../services/dbservices.dart';
import '../reusables/posterbox.dart';
import '../constants.dart';
import '../reusables/infobox.dart';
import '../reusables/theatretab.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  DbServices Db = DbServices();
  List<Theatre> theatres = [];
  @override
  void initState() {
    super.initState();
    setThings();
  }

  void setThings() async {
    theatres = await Db.getTheatres();
    setState(() {});
  }

  List<Widget> getTheatre(Movie selectedMovie) {
    List<TheatreTab> theatresTab = [];
    for (var currentTheatre in theatres) {
      TheatreTab tab = TheatreTab(
        name: currentTheatre.name,
        address: currentTheatre.address,
        id: currentTheatre.id,
        onPress: (){
          showModalBottomSheet(context: context, builder: (BuildContext context){
            return BookingSheet(selectedMovie: selectedMovie, selectedTheatre: currentTheatre,);
          });
        },
      );
      theatresTab.add(tab);
    }
    return theatresTab;
  }

  @override
  Widget build(BuildContext context) {
    var genre = widget.movie.genre;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Movie Detail',
          style: kTextStyle3,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PosterBox(
                        imageString: widget.movie.poster,
                        onPress: () {},
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoBox(
                            icon: Icons.videocam,
                            label: 'Genre',
                            text: genre.substring(
                              0,
                              (!genre.contains(','))
                                  ? genre.length
                                  : genre.indexOf(','),
                            ),
                          ),
                          InfoBox(
                            icon: Icons.access_time,
                            label: 'Duration',
                            text: widget.movie.duration,
                          ),
                          InfoBox(
                            icon: Icons.star,
                            label: 'Ratings',
                            text: '${widget.movie.rating}/10',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    widget.movie.title,
                    style: kTextStyle1,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                Text(
                  'Theatres Available',
                  style: kTextStyle3.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                ...getTheatre(widget.movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
