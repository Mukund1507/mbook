import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbook/models/movie.dart';
import 'package:mbook/models/theatre.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:mbook/constants.dart';
import 'package:mbook/reusables/roundedtextbutton.dart';

class BookingSheet extends StatefulWidget {
  const BookingSheet(
      {Key? key, required this.selectedMovie, required this.selectedTheatre})
      : super(key: key);
  final Movie selectedMovie;
  final Theatre selectedTheatre;

  @override
  State<BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends State<BookingSheet> {
  String date = '';
  int time = 11;
  int noOfTickets = 1;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white54,
              ),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Theme.of(context).primaryColor,
                selectedTextColor: Colors.black,
                onDateChange: (date) {
                  this.date = date.toString();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeSelectionBox(
                  time: '11:00 AM',
                  onPress: () {
                    time = 11;
                    setState(() {});
                  },
                  color: (time == 11)? theme.primaryColor: theme.secondaryHeaderColor,
                ),
                TimeSelectionBox(
                  time: '02:00 PM',
                  onPress: () {
                    time = 2;
                    setState(() {});
                  },
                  color: (time == 2)? theme.primaryColor: theme.secondaryHeaderColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeSelectionBox(
                  time: '05:00 PM',
                  onPress: () {
                    time = 5;
                    setState(() {});
                  },
                  color: (time == 5)? theme.primaryColor: theme.secondaryHeaderColor,
                ),
                TimeSelectionBox(
                  time: '08:00 PM',
                  onPress: () {
                    time = 8;
                    setState(() {});
                  },
                  color: (time == 8)? theme.primaryColor: theme.secondaryHeaderColor,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: theme.scaffoldBackgroundColor,
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        (noOfTickets<10) ? ++noOfTickets: noOfTickets;
                      });
                    },
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: theme.scaffoldBackgroundColor,
                      child: const Icon(
                        Icons.remove_circle_outline,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        (noOfTickets == 1)? noOfTickets = 1 : --noOfTickets;
                      });
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text('$noOfTickets',style: kTextStyle1.copyWith(
                      fontSize: 20,
                    ),),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedTextButton(text: 'Book your show', textStyle: kTextStyle1, color: theme.primaryColor, onPress: (){}),
          ],
        ),
      ),
    );
  }
}

class TimeSelectionBox extends StatelessWidget {
  const TimeSelectionBox(
      {Key? key,
      required this.time,
      required this.color,
      required this.onPress})
      : super(key: key);
  final String time;
  final Color color;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Text(
          time,
          style: kTextStyle1,
        ),
      ),
    );
  }
}
