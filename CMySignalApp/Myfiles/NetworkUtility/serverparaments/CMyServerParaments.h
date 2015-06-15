//
//  CMyServerParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark    user all interface key public paraments define
#define USER_ALL_PUBLIC_PARA_TOKEN           @"token"
#define USER_ALL_PUBLIC_PARA_USERID          @"userId"

#pragma mark    user register get msg code interface key paraments define
#define USER_LOGIN_PARA_USERPHONE             @"userphone"
#define USER_LOGIN_PARA_USERTYPE              @"usertype"

#pragma mark    user refresh token interface key paraments define
#define USER_TOKEN_PARA_OLD                   @"token"
#define USER_TOKEN_PARA_USERTYPE              USER_LOGIN_PARA_USERTYPE

#pragma mark    user register interface key paraments define
#define USER_REGISTER_PARA_USERPHONE          @"mobile"
#define USER_REGISTER_PARA_USERPWD            @"passwd"
#define USER_REGISTER_PARA_MSGCODE            @"msgcode"
#define USER_REGISTER_PARA_USERTYPE           USER_LOGIN_PARA_USERTYPE


#pragma mark    user login interface key paraments define
#define USER_LOGIN_PARA_USERNAME             @"loginName"
#define USER_LOGIN_PARA_USERPWD              @"password"

#pragma mark    worker load tuijian list interface key paraments define
#define WORKER_LOAD_TUIJIAN_PARA_WORKERID             @"user_id"
#define WORKER_LOAD_TUIJIAN_PARA_WORKTYPE             @" user_type"

#pragma mark  user load worker list interface key paraments define
#define USER_LOAD_WORKERS_PARA_USERID               @"user_id"
#define USER_LOAD_WORKERS_PARA_USERTYPE             @"user_type"
#define USER_LOAD_WORKERS_PARA_USERTOKEN            @"token"
#define USER_LOAD_WORKERS_PARA_USERPAGE             @"page"

#pragma mark  user load order list interface key paraments define
#define USER_LOAD_ORDERS_PARA_USERID               @"user_id"
#define USER_LOAD_ORDERS_PARA_USERTYPE             @"user_type"
#define USER_LOAD_ORDERS_PARA_USERTOKEN            @"token"
#define USER_LOAD_ORDERS_PARA_USERPAGE             @"page"





@interface CMyServerParaments : NSObject
{
    NSMutableDictionary* pretdic;
}

-(instancetype) initWithMyself;

-(NSString*) GetToken;
-(NSString*) GetUserID;

-(NSDictionary*) GetServerInterfaceParamens;



@end
