import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/debug_prints.dart';
import '../local/persistence.dart';
import 'parser.dart';

class NetworkManager {
  late Dio dio;
  CancelToken? cancelToken;
  

  Map<String, dynamic> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.cacheControlHeader: "no-cache",
    HttpHeaders.acceptEncodingHeader: "gzip, deflate, br",
    HttpHeaders.connectionHeader: "keep-alive",
  };

  Map<String, dynamic> headersFile = {
    "Content-Type": "multipart/form-data",
  };

  NetworkManager({this.cancelToken}) {
    dio =  Dio();
    dio.options = BaseOptions(
    
      headers: headers,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        error: true));
  }

  void _updateHeaders() {
    print("Updateing Header");
    if (AppCache.instance.getApiToken() != null) {
      String? token = AppCache.instance.getApiToken()!;
      print("Getting Token");
      print(token);
      if (token != null) {
        headers['Authorization'] = "Bearer $token";
      }
    }

  }

  void _updateHeadersFile() {
    if (AppCache.instance.getApiToken()! != null) {
      String? token = AppCache.instance.getApiToken()!;
      if (token != null) {
        headersFile['Authorization'] = "Bearer $token";
      }
    }
  }

  Future<T?> get<T>(String url, {Map<String, dynamic>? params}) async {
    _updateHeaders();
    print(headers);
    params ??= {};
    print(params);

    Response response = await dio.get(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));
    print(response.statusCode);
    print("*************");
    return parseResponse<T>(response);
  }

  Future<List<T>?> getList<T>(String url,
      {Map<String, dynamic>? params, bool? needToken}) async {
    if (needToken != null && needToken) _updateHeaders();
    params ??= {};

    Response response = await dio.get(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));
    return parseListResponse<T>(response);
  }

  Future<T?> post<T>(String url, {Map<String, dynamic>? body}) async {
    //_updateHeaders();
    body ??= {};
    print(body);

    var formData = json.encode(body);
    Response response = await dio.post(url,
        cancelToken: cancelToken,
        options: Options(headers: headers),
        data: formData);

    return parseResponse<T>(response);
  }

  Future<T?> put<T>(String url, {String? body}) async {
    _updateHeaders();
    body ??= "";

    var formData = json.encode(body);
    print(formData);
    var updatedData = jsonDecode(formData);
    print(updatedData);

    Response response = await dio.put(url,
        cancelToken: cancelToken,
        options: Options(headers: headers),
        data: updatedData);
    return parseResponse<T>(response);
  }

  Future<Response> postString(String url, String body) async {
    _updateHeaders();

    Response response = await dio.post(url,
        cancelToken: cancelToken,
        options: Options(headers: headers),
        data: body);

    return response;
  }

  Future<T?> patch<T>(String url, {Map<String, dynamic>? body}) async {
    _updateHeaders();
    body ??= {};

    Response response = await dio.patch(url,
        queryParameters: body,
        cancelToken: cancelToken,
        options: Options(headers: headers));

    return parseResponse<T>(response);
  }

  Future<T?> delete<T>(String url, {Map<String, dynamic>? params}) async {
    _updateHeaders();
    params ??= {};
//    print(params);

    Response response = await dio.delete(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));

    return parseResponse<T>(response);
  }

  T? parseResponse<T>(Response response) {
    if (response.statusCode != 200) return null;

    var map;
    if (T == null || T == dynamic) {
      return response.data;
    } else {
      map = response.data;
    }
    return Parser.parse<T>(map);
  }

  List<T>? parseListResponse<T>(Response response) {
    if (response.statusCode != 200) return null;

    var map;
    if (T == null || T == dynamic) {
      return response.data;
    } else {
      map = response.data;
    }

    List<T> list = [];

    (map as List).forEach((m) {
      list.add(Parser.parse<T>(m));
    });

    return list;
  }









 Future<T?> gets<T>(String url, {Map<String, dynamic>? params}) async {
    _updateHeaders();
    print(headers);
    params ??= {};
    print(params);

    Response response = await dio.get(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));
    print(response.statusCode);
    print("*************");
    return parseResponse<T>(response);
  }



}
