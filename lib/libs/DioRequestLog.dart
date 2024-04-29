import 'dart:developer';

// show more detail every dio request

displayError(error){
  if (error.response != null) {
    log("Request Data : " + error.response.data);
    log(error.response.headers);
    log(error.response.requestOptions);
  } else {
    log(error.requestOptions);
    log(error.message);
  }
}