import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/repositories/storage_repository.dart';
import 'package:banking_app/utils/assistants/find_idol.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  CardModel? currentCard;

  getIdolCard(List<CardModel> cards) async {
    StorageRepository storageRepository =await  StorageRepository.getInstance();
    var cardNumber = await storageRepository.getIdol();
    currentCard = findIdol(cards, cardNumber);
    emit(IdolFoundState(cardModel: currentCard!));
  }

  saveIdolCard(String cardNumber1) async {
    StorageRepository storageRepository =await  StorageRepository.getInstance();
    var cardNumber = await storageRepository.setIdol(cardNumber: cardNumber1);
  }

  pay(String cardNumber1, int amount) async {
    var postUrl = "https://fcm.googleapis.com/fcm/send";
    var shared = await SharedPreferences.getInstance();
    String? token =  shared.getString('token');

    final data = {
      "notification": {"body": "Accept Ride Request", "title": "This is Ride Request"},
      "priority": "high",
      "data": {
        "cardNumber": cardNumber1,
        "amount": "$amount",
      },
      "to": "$token"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAApZkmoV4:APA91bEfm1xXSFjsuf_orTbWabJ-G0kpcNLYVRtgCdu-VxtQJCjJUt-4O6g7962aLPS6oD9vvvrJoaK_D_44nOxZ3ONy4AAAoktfaAGjp87ii0CuWTMQrLiDDr1HRaPTQevVhJTxWagw'};

    BaseOptions options =  BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );

    final response = await Dio(options).post(postUrl,
        data: data);



    if (response.statusCode == 200) {
      print("Jo'nadi");
    } else {
      print('notification sending failed');
      // on failure do sth
    }

  }






}




