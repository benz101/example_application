class FormattedString {
  static String formatted(String param){
    String formattedString = param
    .replaceAll("[", "")  //remove the right bracket
    .replaceAll("]", "")  //remove the left bracket
    .trim();

    return formattedString; 
  }
}