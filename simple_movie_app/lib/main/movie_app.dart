import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'movie.dart';

class MovieListView extends StatelessWidget {
  // final List movies = [
  //   "Titanic",
  //   "Rambo",
  //   "Blade Runner",
  //   "The Avengers",
  //   "Avatar",
  //   "I Am Legend",
  //   "300",
  //   "The Wolf of Wall Street",
  //   "Interstellar",
  //   "Hulk",
  //   "Spiderman",
  //   "Titanic",
  //   "Rambo",
  //   "Blade Runner",
  //   "The Avengers",
  //   "Avatar",
  //   "I Am Legend",
  //   "300",
  //   "The Wolf of Wall Street",
  //   "Interstellar",
  //   "Hulk",
  //   "Spiderman"
  // ];

  final List<Movie> movieList = Movie.getMovies();

  MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.grey.shade700,
      ),
      backgroundColor: Colors.grey.shade500,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              movieCard(movieList[index], context),
              Positioned(
                  top: 5.0, child: movieImage(movieList[index].images[1])),
            ]);

            //WIDGET CARD FOR MOVIE
            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: NetworkImage(movieList[index].images[0]),
            //                 fit: BoxFit.cover),
            //             borderRadius: BorderRadius.circular(14.0)),
            //       ),
            //     ),
            //     trailing: const Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text(movieList[index].director),
            //     // onTap: () =>
            //     //     debugPrint("Movie Name: ${movies.elementAt(index)}"),
            //     onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => MovieListViewDetails(
            //               movieName: movieList.elementAt(index).title,
            //               movie: movieList[index],
            //             )));
            //     },
            //   ),
            // );
          }),
    );
  }

// MOVIE CARD WIDGET
  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        child: Card(
          elevation: 4.5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Rating ${movie.imdbRating} / 10",
                        style:
                            const TextStyle(fontSize: 14.0, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Realeased ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.runtime,
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MovieListViewDetails(movieName: movie.title, movie: movie))),
    );
  }

  TextStyle mainTextStyle() {
    return const TextStyle(fontSize: 14.0, color: Colors.grey);
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}

// new route (screen or page in flutter)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails(
      {super.key, required this.movieName, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.grey.shade700,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie)
        ],
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: Text("Go back ${this.movie.title}"),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail), fit: BoxFit.cover),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black.withOpacity(1),
                //       blurRadius: 10,
                //       offset: Offset(0, 0))
                // ],
              ),
            ),
            const Icon(
              Icons.play_circle_fill_outlined,
              size: 50,
              color: Colors.white,
            )
          ],
        ),
        //Gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 50,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(children: [MoviePoster(poster: movie.images[2].toString())]),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
