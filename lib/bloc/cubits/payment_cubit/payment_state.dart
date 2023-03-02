part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class IdolFoundState extends PaymentState{
  CardModel cardModel;

  IdolFoundState({required this.cardModel});
}
