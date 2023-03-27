
 class LastFiveDays
 {
   final String? dateTime;
   final int? temp;

   LastFiveDays({this.dateTime, this.temp});

   factory LastFiveDays.fromJson(dynamic json) {
     if (json == null) {
       return LastFiveDays();
     }

     var f = json['dt_txt'].split(' ')[0].split('-')[2];
     var l = json['dt_txt'].split(' ')[1].split(':')[0];
     var fandl = '$f-$l';
     return LastFiveDays(
       dateTime: '$fandl',
       temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
     );
   }
 }
