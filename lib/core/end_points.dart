class Endpoints{
  Endpoints._();

  static const String BASE_URL = "https://flutterapi.kortobaa.net";
  static const String POST_LOGIN_API = "$BASE_URL/users/login/";
  static const String POST_SIGNUP_API = "$BASE_URL/users/register/";
  static const String GET_PRODUCTS = "$BASE_URL/api/v1/products/";
  static const String GET_PRODUCTS_BY_ID = "$BASE_URL/api/v1/products/1";
  static const String GET_CATEGORIES = "$BASE_URL/api/v1/categories";
  static const String GET_CATEGORIES_BY_ID = "$BASE_URL/api/v1/products/category/";
}