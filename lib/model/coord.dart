class Coord
{

  double lat ;
  double lon ;

  Coord(this.lat,this.lon);


  // From Map
  factory Coord.fromJson(Map<String,dynamic>json)
  {
    return Coord(
        double.parse(json['lat']),
        double.parse(json['lon'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lon": lon,
    };
  }
}

