//
//  CMyNetWorkInterface.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
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
#import "CMyUserLoginParements.h"
#import "CMyUserLogoutParaments.h"
#import "CMyUserLoadordersParaments.h"
#import "CMyCreateOrderParaments.h"
#import "CMyUserCancelOrderParaments.h"
#import "CMyBeginOrderParaments.h"
#import "CMyFinishOrderParaments.h"
#import "CMyUserConfirmOrderParaments.h"



#import "CMyLoadProductsParaments.h"
#import "CMyLoadServiceParaments.h"


#import "CMyWorkerRefreshContendsParaments.h"
#import "CMyWorkerConfirmContendParaments.h"
#import "CMyWorkerLoadOrderParaments.h"
#import "CMyWorkerCancelOrderParaments.h"


#import "CMyLocalDatas.h"


#pragma mark    server url define

#if 1
#define SERVER_BASE_URL         @"http://121.42.155.82/"
#else
#define SERVER_BASE_URL         @"http://121.42.155.82/"
#endif


// 获取短信验证码
#define USER_REGISTER_MSGCODE_URL                           @"register/get_check_code.json"

// 刷新token
#define USER_REFRESH_TOKEN_URL                              @"register/refresh_token.json"

// 用户注册
#define USER_REGISTER_URL                                   @"register/register.json"

// 用户/美容师 登录
#define USER_LOGIN_URL                                      @"register/log_in.json"

// 用户/美容师 注销
#define USER_LOGOUT_URL                                     @"register/log_out.json"

// 游客登录
#define USER_LOGIN_YOUKE_URL                                @"register/get_user.json"

// 用户读取产品列表
#define USER_LOAD_PRODUCTS_URL                              @"products/list.json"

// 用户读取服务列表
#define USER_LOAD_SERVICES_URL                              @"services/list.json"

// 用户推荐列表
#define USER_TUIJIANLOAD_URL                                @"advertisements/list.json"

// 美容师推荐列表
#define WORKER_TUIJIANLOAD_URL                              @"advertisements/list.json"

// 用户创建订单
#define USER_CREATE_ORDER_URL                               @"appointments/make.json"

// 用户读取订单列表
#define USER_LOAD_ORDER_URL                                 @"appointments/list.json"

// 用户取消预约
#define USER_CANCEL_ORDER_URL                               @"appointments/cancel.json"

// 用户确定预约
#define USER_CONFIRM_ORDER_URL                              @"appointments/confirm.json"

// 预约开始
#define USER_BEGIN_ORDER_URL                                @"appointments/begin.json"

// 施工结束
#define USER_FINISH_ORDER_URL                               @"appointments/finished.json"

// 预约详细信息
#define USER_REVIEW_ORDER_URL                               @"appointments/detail.json"

// 读取最近的发起的预约
#define WORKER_LOAD_CONTENDS_URL                            @"appointments/recent.json"

// 工人应约
#define WORKER_CONFIRM_CONTENDS_URL                         @"appointments/confirm.json"

// 工人取消应约
#define WORKER_CANCEL_ORDER_URL                             @"appointments/cancel.json"

// 工人担子记录
#define WORKER_LOAD_ORDER_URL                               @"appointments/list.json"

// 查看工人详细信息
#define USER_REVIEW_WORKER_URL                              @"workers/1.json"

// 美容师列表
#define USER_LOAD_WORKERS_URL                               @"workers/list.json"




//
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

// 用户/美容师登录
-(NSString*) GetLoginURL;
-(NSString*) UserLogin:(NSDictionary*)pdicinfo;

// 用户/美容师注销
-(NSString*) GetLogoutURL;
-(NSString*) UserLogout:(NSDictionary*)pdicinfo;

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

// 用户创建订单
-(NSString*) GetusercreateorderURL;
-(NSString*) UserCreateOrder:(NSDictionary*)pdicinfo;

// 读取用户历史订单列表
-(NSString*) GetuserordersURL;
-(NSString*) UserOrderlistload:(NSDictionary*)pdicinfo;

// 读取用户产品列表
-(NSString*) GetProductsURL;
-(NSString*) Productslistload:(NSDictionary*)pdicinfo;

// 读取用户服务列表
-(NSString*) GetServicesURL;
-(NSString*) Serviceslistload:(NSDictionary*)pdicinfo;

// 用户取消预约
-(NSString*) GetUserCancelOrderURL;
-(NSString*) UserCancelOrder:(NSDictionary*)pdicinfo;

// 用户确认预约
-(NSString*) GetUserConfirmOrderURL;
-(NSString*) UserConfirmOrder:(NSDictionary*)pdicinfo;

// 开始施工
-(NSString*) GetOrderBeginURL;
-(NSString*) UserOrderBegin:(NSDictionary*)pdicinfo;

// 施工结束
-(NSString*) GetOrderFinishURL;
-(NSString*) UserOrderFinish:(NSDictionary*)pdicinfo;

// 预约详细信息
-(NSString*) GetOrderDetailURL;
-(NSString*) UserOrderDetail:(NSDictionary*)pdicinfo;

// 工人详细信息
-(NSString*) GetWorkerDetailURL;
-(NSString*) UserWorkerDetail:(NSDictionary*)pdicinfo;

// 工人抢单列表
-(NSString*) GetWorkerContendURL;
-(NSString*) WorkerContend:(NSDictionary*)pdicinfo;

// 工人应约
-(NSString*) GetWorkerConfirmContendURL;
-(NSString*) WorkerConfirmContend:(NSDictionary*)pdicinfo;

// 工人担子记录
-(NSString*) GetWorkerOrdersURL;
-(NSString*) WorkerOrders:(NSDictionary*)pdicinfo;

// 工人取消担子
-(NSString*) GetWorkerCancelOrderURL;
-(NSString*) WorkerCancelOrder:(NSDictionary*)pdicinfo;






@end
