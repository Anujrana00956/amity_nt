import 'dart:convert';
import 'dart:io';

import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/utils/connectivity.dart';
import 'package:amity_nt/amity/app/core/utils/extensions/extensions.dart';
import 'package:amity_nt/amity/features/data/data_sources/local/api_headers.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static const String baseUrl = "DataConstants.baseUrl";

 static Future<ResponseModel> makeRequest({
     required MethodRequest request,
     required String url, 
      bool? isLoading,
      dynamic data,
      Map<String, String>? headers,
      Map<String, String> files = const {}}) async {

    if (ConnectivityService.isConnected.value) {
      final Uri uri = Uri.parse(baseUrl + url);
      late http.Response response;

      switch (request) {
        case MethodRequest.get:
          {
            response = await http
                .get(uri, headers: headers ?? ApiHeaders().headers)
                .timeout(const Duration(seconds: 10));
            break;
          }
        case MethodRequest.post:
          {
            response = await http
                .post(uri, body: data, headers: headers ?? ApiHeaders().headers)
                .timeout(const Duration(seconds: 30));
            break;
          }
        case MethodRequest.put:
          {
            response = await http
                .put(uri, body: data, headers: headers ?? ApiHeaders().headers)
                .timeout(const Duration(seconds: 60));
            break;
          }
        case MethodRequest.delete:
          {
            response = await http
                .delete(uri,
                    body: data, headers: headers ?? ApiHeaders().headers)
                .timeout(const Duration(seconds: 60));
            break;
          }
        case MethodRequest.multiPartfile:
          {
            var request = http.MultipartRequest('POST', uri)
              ..headers.addAll(headers ?? ApiHeaders().headers)
              ..fields.addAll(data);

            List<http.MultipartFile> newList = [];

            for (var img in files.entries) {
              http.MultipartFile multipartFile;
              if (img.value.contains('http')) {
                multipartFile = http.MultipartFile.fromBytes(
                  img.key,
                  await http.readBytes(
                    Uri.parse(img.value),
                  ),
                  filename: img.value.split('/').last,
                );
              } else {
                multipartFile = await http.MultipartFile.fromPath(
                  img.key,
                  img.value,
                );
              }

              newList.add(multipartFile);
            }
            if (newList.isNotEmpty) {
              request.files.addAll(newList);
            }

            var streamedResponse = await request.send();
            response = await http.Response.fromStream(streamedResponse);
            break;
          }
      }
      "apiUri => $url\ndata: => $data\nfiles: $files\nstatusCode: ${response.statusCode}\nresponse: => ${response.body}"
          .logPrint;

      return returnResponse(response);
    }
    else{
         "--> 1. -->".logPrint;
      throw const SocketException.closed();
    }
  }
  
}

ResponseModel returnResponse(http.Response response) {
  if (jsonDecode(response.body)['status'] ?? false) {
    return ResponseModel(
      data: response.body,
      hasError: false,
      statusCode: response.statusCode,
    );
  } else {
    return ResponseModel(
        data: response.body, hasError: true, statusCode: response.statusCode);
  }
}
