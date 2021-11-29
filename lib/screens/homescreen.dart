import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/movie.dart';
import '../screens/moviedetailscreen.dart';
import '../services/moviemodel.dart';
import '../constants.dart';
import '../reusables/posterbox.dart';
import '../reusables/roundtextfield.dart';
import '../otherwidgets/topgreeting.dart';
import '../otherwidgets/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.userName);
  final String userName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> topMovies = [
    {'year': '2021', 'name': 'Bhoot police'},
    {'year': '2021', 'name': 'Shershaah'},
    {'year': '2021', 'name': 'mimi'},
    {'year': '2021', 'name': 'bhuj'}
  ];
  String searchMovieName = '';
  Movie movie0 = const Movie(
      title: '__',
      id: '',
      poster: loadingImage,
      duration: '__',
      rating: '__',
      genre: '__');
  Movie movie1 = const Movie(
      title: '__',
      id: '',
      poster: loadingImage,
      duration: '__',
      rating: '__',
      genre: '__');
  Movie movie2 = const Movie(
      title: '__',
      id: '',
      poster: loadingImage,
      duration: '__',
      rating: '__',
      genre: '__');
  Movie movie3 = const Movie(
      title: '__',
      id: '',
      poster: loadingImage,
      duration: '__',
      rating: '__',
      genre: '__');
  Movie movieForSearch = const Movie(
      title: '__',
      id: '',
      poster: loadingImage,
      duration: '__',
      rating: '__',
      genre: '__');
  @override
  void initState() {
    super.initState();
    setThings();
  }

  void setThings() async {
    MovieModel movieModel = MovieModel();
    List<Movie> myList = [];
    for (int i = 0; i < 4; i++) {
      var data = await movieModel.getMovieDetails(
          topMovies[i]['name'], topMovies[i]['year']);
      Movie temp = Movie(
          title: data['Title'],
          id: data['imdbID'],
          poster: data['Poster'],
          duration: data['Runtime'],
          rating: data['imdbRating'],
          genre: data['Genre']);
      myList.add(temp);
    }
    movie0 = myList[0];
    movie1 = myList[1];
    movie2 = myList[2];
    movie3 = myList[3];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TopGreeting(
                name: widget.userName,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedTextField(
                onChange: (value) {
                  searchMovieName = value;
                },
                onSubmit: (value) async {
                  MovieModel movieModel = MovieModel();
                  var data =
                  await movieModel.getMovieDetailsByName(searchMovieName);
                  movieForSearch = Movie(
                      title: data['Title'],
                      id: data['imdbID'],
                      poster: data['Poster'],
                      duration: data['Runtime'],
                      rating: data['imdbRating'],
                      genre: data['Genre']);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return MovieDetailScreen(movie: movieForSearch);
                    }),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Category(),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: [
                  PosterBox(
                    onPress: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) {
                          return MovieDetailScreen(movie: movie0);
                        }),
                      );
                    },
                    imageString: movie0.poster,
                  ),
                  PosterBox(
                    onPress: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) {
                          return MovieDetailScreen(movie: movie1);
                        }),
                      );
                    },
                    imageString: movie1.poster,
                  ),
                  PosterBox(
                    onPress: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) {
                          return MovieDetailScreen(movie: movie2);
                        }),
                      );
                    },
                    imageString: movie2.poster,
                  ),
                  PosterBox(
                    onPress: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) {
                          return MovieDetailScreen(movie: movie3);
                        }),
                      );
                    },
                    imageString: movie3.poster,
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 1.4,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
