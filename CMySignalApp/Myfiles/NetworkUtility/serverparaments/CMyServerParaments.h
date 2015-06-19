//
//  CMyServerParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CMyLocalDatas.h"


#pragma mark    user all interface key public paraments define
#define USER_ALL_PUBLIC_PARA_TOKEN           @"token"
#define USER_ALL_PUBLIC_PARA_USERID          @"userId"

#pragma mark    user register get msg code interface key paraments define
#define USER_LOGIN_PARA_USERPHONE             @"mobile"
#define USER_LOGIN_PARA_USERTYPE              @"user_type"

#pragma mark    user refresh token interface key paraments define
#define USER_TOKEN_PARA_OLD                   @"token"
#define USER_TOKEN_PARA_USERTYPE              @"user_type"

#pragma mark    user register interface key paraments define
#define USER_REGISTER_PARA_USERPHONE          @"mobile"
#define USER_REGISTER_PARA_USERPWD            @"password"
#define USER_REGISTER_PARA_MSGCODE            @"check_code"
#define USER_REGISTER_PARA_USERTYPE           @"user_type"

#pragma mark    user login interface key paraments define
#define USER_LOGIN_PARA_USERNAME             @"mobile"
#define USER_LOGIN_PARA_USERPWD              @"password"
#define USER_LOGIN_PARA_TYPE                 @"user_type"

#pragma mark    user login interface key paraments define
#define USER_LOGOUT_PARA_USERNAME             @"mobile"
#define USER_LOGOUT_PARA_TOKEN                @"token"
#define USER_LOGOUT_PARA_TYPE                 @"user_type"

#pragma mark    worker load tuijian list interface key paraments define
#define WORKER_LOAD_TUIJIAN_PARA_WORKERPHONE          @"mobile"
#define WORKER_LOAD_TUIJIAN_PARA_WORKTYPE             @"user_type"
#define WORKER_LOAD_TUIJIAN_PARA_TOKEN                @"token"
#define WORKER_LOAD_TUIJIAN_PARA_PAGE                 @"page"

#pragma mark  user load worker list interface key paraments define
#define USER_LOAD_WORKERS_PARA_USERID               @"mobile"
#define USER_LOAD_WORKERS_PARA_USERTYPE             @"user_type"
#define USER_LOAD_WORKERS_PARA_USERTOKEN            @"token"
#define USER_LOAD_WORKERS_PARA_USERPAGE             @"page"

#pragma mark  user load order list interface key paraments define
#define USER_LOAD_ORDERS_PARA_USERPHONE            @"mobile"
#define USER_LOAD_ORDERS_PARA_USERTYPE             @"user_type"
#define USER_LOAD_ORDERS_PARA_USERTOKEN            @"token"
#define USER_LOAD_ORDERS_PARA_USERPAGE             @"page"

#pragma mark  user load order list interface key paraments define
#define USER_CREATE_ORDERS_PARA_USERPHONE            @"mobile"
#define USER_CREATE_ORDERS_PARA_USERTYPE             @"user_type"
#define USER_CREATE_ORDERS_PARA_USERTOKEN            @"token"
#define USER_CREATE_ORDERS_PARA_TIME                 @"date"
#define USER_CREATE_ORDERS_PARA_TIME_B               @"start_time"
#define USER_CREATE_ORDERS_PARA_TIME_E               @"end_time"
#define USER_CREATE_ORDERS_PARA_ADDRESS              @"address"
#define USER_CREATE_ORDERS_PARA_PRODUCT              @"product_id"
#define USER_CREATE_ORDERS_PARA_SERVICE              @"service_id"
#define USER_CREATE_ORDERS_PARA_WORKERID             @"worker_id"
#define USER_CREATE_ORDERS_PARA_STATUS               @"status"

#pragma mark  user load products list interface key paraments define
#define USER_LOAD_PRODUCT_PARA_USERPHONE            @"mobile"
#define USER_LOAD_PRODUCT_PARA_USERTYPE             @"user_type"
#define USER_LOAD_PRODUCT_PARA_USERTOKEN            @"token"

#pragma mark  user cancel order list interface key paraments define
#define USER_CANCEL_ORDER_PARA_USERPHONE            @"mobile"
#define USER_CANCEL_ORDER_PARA_USERTYPE             @"user_type"
#define USER_CANCEL_ORDER_PARA_USERTOKEN            @"token"
#define USER_CANCEL_ORDER_PARA_ORDERID              @"id"

#pragma mark  user begin order list interface key paraments define
#define USER_BEGIN_ORDER_PARA_USERPHONE            @"mobile"
#define USER_BEGIN_ORDER_PARA_USERTYPE             @"user_type"
#define USER_BEGIN_ORDER_PARA_USERTOKEN            @"token"
#define USER_BEGIN_ORDER_PARA_ORDERID              @"id"

#define USER_CONFIRM_ORDER_PARA_WORKERID           @"worker_id"

#define USER_DETAIL_ORDER_PARA_ORDERID             @"page"

#define USER_DETAIL_WORKER_PARA_WORKERID           @"worker_id"

#pragma mark worker base define
#define WORKER_BASE_PARA_PHONE                     @"mobile"
#define WORKER_BASE_PARA_TOKEN                     @"token"
#define WORKER_BASE_PARA_TYPE                      @"user_type"
#define WORKER_BASE_PARA_PAGE                      @"page"
#define WORKER_BASE_PARA_CONTENDID                 @"id"






@interface CMyServerParaments : NSObject
{
    NSMutableDictionary* pretdic;
}

-(instancetype) initWithMyself;

-(NSString*) GetToken;
-(NSString*) GetUserID;

-(NSDictionary*) GetServerInterfaceParamens;



@end
