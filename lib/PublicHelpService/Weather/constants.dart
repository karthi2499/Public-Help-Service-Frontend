import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//API URLs
String openWeatherURL = "https://api.openweathermap.org/data/2.5/onecall";
String reverseGeocoding = "http://api.openweathermap.org/geo/1.0/reverse";

//Future settings switch
String appLang = "en";
String appUnits = "metric";

//App Icons
Icon kLightningIcon = Icon(
  FontAwesomeIcons.bolt,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kDrizzleIcon = Icon(
  FontAwesomeIcons.cloudRain,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kRainIcon = Icon(
  FontAwesomeIcons.cloudShowersHeavy,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kSnowIcon = Icon(
  FontAwesomeIcons.snowflake,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kAtmosphereIcon = Icon(
  FontAwesomeIcons.smog,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kSunIcon = Icon(
  FontAwesomeIcons.sun,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kCloudIcon = Icon(
  FontAwesomeIcons.cloud,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kMoonIcon = Icon(
  FontAwesomeIcons.moon,
  size: 75.0,
  color: Color(0xff3a3a36),
);

Icon kErrorIcon = Icon(
  FontAwesomeIcons.solidQuestionCircle,
  size: 75.0,
  color: Color(0xff3a3a36),
);

//App colours
const Color kCardLight = Color(0xff3a3a36);
const Color kBackLight = Color(0xff3a3a36);
const Color kCardDark = Color(0xff3a3a36);
const Color kBackDark = Color(0xff3a3a36);
const Color kTextDark = Color(0xff3a3a36);
const Color kCardColor = Color(0xff3a3a36); //To be retired later

//Font styles
const TextStyle kMaxTempStyle = TextStyle(fontSize: 15, color: Color(0xff3a3a36));
const TextStyle kMinTempStyle = TextStyle(fontSize: 15, color: Color(0xff3a3a36));
const TextStyle kWeekdayStyle = TextStyle(fontSize: 13, color: Color(0xff3a3a36));

//Map of Days and Months
const kWeekdays = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday'
};

const kMonths = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};