//Captisalise the start of the input, for names/cities
extension StringExtension on String{
  String capitalise(){
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}