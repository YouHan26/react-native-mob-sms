//
//  MobSMS.m
//  hiStreet
//
//  Created by youhan on 2017/1/12.
//  Copyright © 2017年 LiangZhan. All rights reserved.
//

#import "MobSMS.h"
#import "SMS_SDK/SMSSDK.h"
#import "SMS_SDK/Extend/SMSSDK+AddressBookMethods.h"
#import "React/RCTConvert.h"
#import "React/RCTBridge.h"
#import "React/RCTEventDispatcher.h"


@interface RCTMobSMS ()

@property (nonatomic, strong) NSString *unreadCountEventName;

@end



@implementation RCTMobSMS

@synthesize bridge=_bridge;

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(registerApp:(NSString*)appKey withSecret:(NSString*)appSecret) {
  [SMSSDK registerApp:appKey withSecret:appSecret];
  [SMSSDK enableAppContactFriends:NO];
}

RCT_EXPORT_METHOD(getVerificationCodeByMethod:(NSInteger)method
                  phoneNumber:(NSString *)phoneNumber
                  zone:(NSString *)zone
                  customIdentifier:(NSString *)customIdentifier
                  //                  result:(RCTResponseErrorBlock)result) {
                  callback:(RCTResponseErrorBlock)callback) {
  
  [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethod)method
                          phoneNumber:phoneNumber
                                 zone:zone
                     customIdentifier:customIdentifier
                               result:^(NSError *error) {
                                 if(error){
                                   callback(error);
                                 }else{
                                   callback(nil);
                                 }
                               }];
}



RCT_EXPORT_METHOD(commitVerificationCode:(NSString *)code
                  phoneNumber:(NSString *)phoneNumber
                  zone:(NSString *)zone
                  //                  result:(SMSCommitCodeResultHandler)result) {
                  callback:(RCTResponseErrorBlock)callback) {
  
  [SMSSDK commitVerificationCode:code
                     phoneNumber:phoneNumber
                            zone:zone
                          result:^(SMSSDKUserInfo *userInfo, NSError *error) {
                            if(error){
                              callback(error);
                            }else{
                              callback(nil);
                            }
                          }];
}



@end
