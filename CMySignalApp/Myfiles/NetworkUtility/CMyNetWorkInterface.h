//
//  CMyNetWorkInterface.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCMyASIFormDataRequest.h"

#import "CCMyASIHTTPRequest.h"
#import "JSON.h"
#import "MyMD5.h"

#import "CMyServerResultData.h"

#import "CMyUserRegisterParaments.h"
#import "CMyRefreshTokenParaments.h"
#import "CMyGetMsgCodeParaments.h"


#pragma mark    server url define

#if 1
#define SERVER_BASE_URL         @"http://121.42.155.82/"
#else
#define SERVER_BASE_URL         @"http://121.42.155.82/"
#endif


// 获取短信验证码
#define USER_REGISTER_MSGCODE_URL                           @"register/get_code"

// 刷新token
#define USER_REFRESH_TOKEN_URL                              @"register/refresh_token"

// 用户注册
#define USER_REGISTER_URL                                   @"register/get_user"

// 游客登录
#define USER_LOGIN_YOUKE_URL                                @"register/get_user"

// 用户推荐列表
#define USER_TUIJIANLOAD_URL                                @"recommands/list"

// 美容师推荐列表
#define WORKER_TUIJIANLOAD_URL                              @"recommands/list"

// 美容师列表
#define USER_LOAD_WORKERS_URL                               @"workers/list"

// 用户订单列表
#define USER_LOAD_ORDER_URL                                 @"customers/history"


@interface CMyNetWorkInterface : NSObject
{
    
}

+(CMyNetWorkInterface*) SharedNetWork;

//通用的服务器访问请求
-(NSString*) ModuleServerRequest:(NSString*)surl para:(NSDictionary*)pdicinfo;

// 短息验证码
-(NSString*) GetMsgCodeURL;
-(NSString*) UserMsgCode:(NSDictionary*)pdicinfo;

// 用户注册
-(NSString*) GetUserRegisterURL;
-(NSString*) UserRegister:(NSDictionary*)pdicinfo;

// 刷新token
-(NSString*) GetRefreshTokenURL;
-(NSString*) UserRefreshToken:(NSDictionary*)pdicinfo;

// 用户获取美容师列表
-(NSString*) GetWorkerListURL;
-(NSString*) UserLoadWorkerlist:(NSDictionary*)pdicinfo;

// 游客登录
-(NSString*) GetLoginWithyoukeURL;
-(NSString*) UserLoginWithyouke:(NSDictionary*)pdicinfo;

// 读取用户推荐列表
-(NSString*) GetusertuijianURL;
-(NSString*) Usertuijianload:(NSDictionary*)pdicinfo;

// 读取美容师推荐列表
-(NSString*) GetworkertuijianURL;
-(NSString*) Workertuijianload:(NSDictionary*)pdicinfo;

// 读取用户历史订单列表
-(NSString*) GetuserordersURL;
-(NSString*) UserOrderlistload:(NSDictionary*)pdicinfo;
















@end
