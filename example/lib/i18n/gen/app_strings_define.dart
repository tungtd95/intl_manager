// DO NOT EDIT. This is code generated via package:intl_manager

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AppStringsDefine {
  static const List<String> _supportedLanguageCode = ['zh','en'];
  static const List<List<String>> _supportedLocaleMap = [['zh',''],['en','']];

  static List<String> getSupportedLanguageCodes(){
    return _supportedLanguageCode;
  }

  static List<Locale> createSupportedLocale(bool appendCountryCode){
    List<Locale> result = [];
    for (List<String> c in _supportedLocaleMap) {
      result.add(Locale(c[0], appendCountryCode ? c[1] : ''));
    }
    return result;
  }

  String get merchantWalletStringsVer => Intl.message('20200428 - 09:56', name: 'merchantWalletStringsVer');
  String get merchantWalletHomeTitleMyWallet => Intl.message('Ví của tôi', name: 'merchantWalletHomeTitleMyWallet');
  String get merchantWalletHomeLabelUsableBalance => Intl.message('Chưa quyết toán', name: 'merchantWalletHomeLabelUsableBalance');
  String merchantWalletHomeDesReceiveFrom(strArg0) => Intl.message('Nhận tiền $strArg0', name: 'merchantWalletHomeDesReceiveFrom');
  String get merchantWalletHomeLabelUnsettledBalance => Intl.message('Khả dụng', name: 'merchantWalletHomeLabelUnsettledBalance');
  String merchantWalletHomeDesFundInFrom(strArg0) => Intl.message('Nạp tiền từ $strArg0', name: 'merchantWalletHomeDesFundInFrom');
  String merchantWalletHomeDesFundOutTo(strArg0) => Intl.message('Rút tiền về $strArg0', name: 'merchantWalletHomeDesFundOutTo');
  String merchantWalletHomeDesTransferTo(strArg0) => Intl.message('Chuyển đến $strArg0', name: 'merchantWalletHomeDesTransferTo');
  String get merchantWalletHomeTitleTransactionHistory => Intl.message('Lịch sử giao dịch', name: 'merchantWalletHomeTitleTransactionHistory');
  String get merchantWalletBottomsheetTitleNote => Intl.message('Ghi chú', name: 'merchantWalletBottomsheetTitleNote');
  String get merchantWalletBottomsheetTitleActualBalance => Intl.message('Số dư khả dụng', name: 'merchantWalletBottomsheetTitleActualBalance');
  String get merchantWalletBottomsheetDes1ActualBalance => Intl.message('Là phần doanh thu đã quyết toán sau khi trừ đi phí trả cho VinID.', name: 'merchantWalletBottomsheetDes1ActualBalance');
  String get merchantWalletBottomsheetDes2ActualBalance => Intl.message(' Bạn có thể rút tiền, nạp tiền, chuyển tiền hoặc thanh toán với số dư này.', name: 'merchantWalletBottomsheetDes2ActualBalance');
  String get merchantWalletBottomsheetTitleUnfinalizedBalance => Intl.message('Số dư chưa quyết toán', name: 'merchantWalletBottomsheetTitleUnfinalizedBalance');
  String get merchantWalletBottomsheetDes1UnfinalizedBalance => Intl.message('Là phần doanh thu chưa quyết toán, chưa trừ đi phí trả cho VinID.', name: 'merchantWalletBottomsheetDes1UnfinalizedBalance');
  String get merchantWalletBottomsheetDes2UnfinalizedBalance => Intl.message(' Bạn không thể rút tiền, nạp tiền, chuyển tiền hoặc thanh toán với số dư này.', name: 'merchantWalletBottomsheetDes2UnfinalizedBalance');
  String get merchantWalletBottomsheetDes3UnfinalizedBalance => Intl.message('Sau khi quyết toán, số dư này sẽ chuyển vào số dư khả dụng của bạn.', name: 'merchantWalletBottomsheetDes3UnfinalizedBalance');
  String get merchantWalletEmptyTitle => Intl.message('Trải nghiệm ngay ví VinID Pay thôi!', name: 'merchantWalletEmptyTitle');
  String get merchantWalletEmptyDes => Intl.message('Ví thông minh giúp bạn quản lý dòng tiền và kiểm tra số dư hiệu quả.', name: 'merchantWalletEmptyDes');
  String get merchantWalletLabelTransactionInfo => Intl.message('Thông tin giao dịch', name: 'merchantWalletLabelTransactionInfo');
  String get merchantWalletLabelService => Intl.message('Dịch vụ', name: 'merchantWalletLabelService');
  String get merchantWalletLabelServiceID => Intl.message('Mã giao dịch', name: 'merchantWalletLabelServiceID');
  String get merchantWalletLabelTransactionTime => Intl.message('Thời gian giao dịch', name: 'merchantWalletLabelTransactionTime');
  String get merchantWalletLabelPaymentInfo => Intl.message('Thông tin thanh toán', name: 'merchantWalletLabelPaymentInfo');
  String get merchantWalletLabelRevenueReceive => Intl.message('Tổng doanh thu', name: 'merchantWalletLabelRevenueReceive');
  String get merchantWalletLabelRefund => Intl.message('Hoàn cho khách', name: 'merchantWalletLabelRefund');
  String get merchantWalletLabelFee => Intl.message('Phí', name: 'merchantWalletLabelFee');
  String get merchantWalletLabelActualReceive => Intl.message('Thực nhận', name: 'merchantWalletLabelActualReceive');
  String get merchantWalletLabelFinalBalance => Intl.message('Số dư sau GD', name: 'merchantWalletLabelFinalBalance');
  String get merchantWalletBottomsheetTitlePickWallet => Intl.message('Chọn ví', name: 'merchantWalletBottomsheetTitlePickWallet');
  String get merchantWalletBottomsheetLabelLocked => Intl.message('Đã khóa', name: 'merchantWalletBottomsheetLabelLocked');
  String merchantWalletMsgWalletMaintenanceAt(strArg0, strArg1) => Intl.message('Hệ thống ví được bảo trì vào $strArg0 ngày $strArg1', name: 'merchantWalletMsgWalletMaintenanceAt');
  String get merchantWalletLabelTransactionSuccess => Intl.message('Giao dịch thành công', name: 'merchantWalletLabelTransactionSuccess');
  String get merchantWalletLabelTransactionFailed => Intl.message('Giao dịch thất bại', name: 'merchantWalletLabelTransactionFailed');
  String get merchantWalletLabelTransactionProcessing => Intl.message('Giao dịch chờ xử lý', name: 'merchantWalletLabelTransactionProcessing');
  String get merchantWalletTransactionDetailLabelSetteled => Intl.message('Quyết toán', name: 'merchantWalletTransactionDetailLabelSetteled');
  String get merchantWalletTransactionDetailLabelTopUp => Intl.message('Nạp tiền', name: 'merchantWalletTransactionDetailLabelTopUp');
  String get merchantWalletTransactionDetailLabelWithdraw => Intl.message('Rút tiền', name: 'merchantWalletTransactionDetailLabelWithdraw');
  String get merchantWalletTransactionDetailLabelTransfer => Intl.message('Chuyển tiền', name: 'merchantWalletTransactionDetailLabelTransfer');
  String get merchantWalletTransactionDetailLabelRefund => Intl.message('Hoàn tiền', name: 'merchantWalletTransactionDetailLabelRefund');
  String get merchantWalletTransactionDetailLabelFundSource => Intl.message('Nguồn tiền', name: 'merchantWalletTransactionDetailLabelFundSource');
  String get merchantWalletTransactionDetailLabelReceiveAccount => Intl.message('Tài khoản nhận', name: 'merchantWalletTransactionDetailLabelReceiveAccount');
  String get merchantWalletTransactionDetailLabelReceiver => Intl.message('Người nhận', name: 'merchantWalletTransactionDetailLabelReceiver');
  String get merchantWalletLabelFree => Intl.message('Miễn phí', name: 'merchantWalletLabelFree');
  String get merchantWalletLabelMoneyAmount => Intl.message('Số tiền', name: 'merchantWalletLabelMoneyAmount');
  String get merchantWalletLabelTotalAmount => Intl.message('Tổng tiền', name: 'merchantWalletLabelTotalAmount');
}
