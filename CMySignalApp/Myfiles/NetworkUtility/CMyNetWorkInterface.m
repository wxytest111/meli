//
//  CMyNetWorkInterface.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyNetWorkInterface.h"

CMyNetWorkInterface*    g_NetWorkInterface = nil;

@implementation CMyNetWorkInterface


+(CMyNetWorkInterface*) SharedNetWork
{
    if (!g_NetWorkInterface)
    {
        g_NetWorkInterface = [ [CMyNetWorkInterface alloc] init ];
    }
    
    return g_NetWorkInterface;
}

//通用的服务器访问请求
-(NSString*) ModuleServerRequest:(NSString*)surl para:(NSDictionary*)pdicinfo
{
    NSLog(@"url:%@", surl);
    NSLog(@"submit data:%@", pdicinfo);
    NSURL* purl = [ NSURL URLWithString:surl ];
    CCMyASIFormDataRequest* prequest = [CCMyASIFormDataRequest requestWithURL:purl];
    
    NSArray* pkeys = [ pdicinfo allKeys ];
    for (NSInteger i = 0; i < pkeys.count; i++)
    {
        [ prequest setPostValue:[ NSString stringWithFormat:@"%@", [ pdicinfo objectForKey:pkeys[i]] ]
                         forKey:[ NSString stringWithFormat:@"%@", pkeys[i] ] ];
    }
    
    [ prequest startSynchronous ];
    NSError *error = [prequest error];
    if (error)
    {
        return [ NSString stringWithFormat:@"{\"result\":\"F\",\"errorCode\":\"%ld\",\"errorMsg\":\"login error\"}", [ error code ] ];
    }
    NSString* sret = [ prequest responseString ];
    NSLog(@"server return:%@", sret);
    return sret;
}

// 短息验证码
-(NSString*) GetMsgCodeURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_REGISTER_MSGCODE_URL ];
}

-(NSString*) UserMsgCode:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetMsgCodeURL ] para:pdicinfo ];
}

// 用户注册
-(NSString*) GetUserRegisterURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_REGISTER_URL ];
}

-(NSString*) UserRegister:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetUserRegisterURL ] para:pdicinfo ];
}

// 用户/美容师登录
-(NSString*) GetLoginURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOGIN_URL ];
}

-(NSString*) UserLogin:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetLoginURL ] para:pdicinfo ];
}

// 用户/美容师注销
-(NSString*) GetLogoutURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOGOUT_URL ];
}

-(NSString*) UserLogout:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetLogoutURL ] para:pdicinfo ];
}


// 游客登录
-(NSString*) GetLoginWithyoukeURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOGIN_YOUKE_URL ];
}

-(NSString*) UserLoginWithyouke:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetLoginWithyoukeURL ] para:pdicinfo ];
}

// 刷新token
-(NSString*) GetRefreshTokenURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_REFRESH_TOKEN_URL ];
}

-(NSString*) UserRefreshToken:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetRefreshTokenURL ] para:pdicinfo ];
}

// 读取用户推荐列表
-(NSString*) GetusertuijianURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_TUIJIANLOAD_URL ];
}

-(NSString*) Usertuijianload:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetusertuijianURL ] para:pdicinfo ];
}

// 读取美容师推荐列表
-(NSString*) GetworkertuijianURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, WORKER_TUIJIANLOAD_URL ];
}

-(NSString*) Workertuijianload:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetworkertuijianURL ] para:pdicinfo ];
}

// 读取美容师列表
-(NSString*) GetWorkerListURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOAD_WORKERS_URL ];
}

-(NSString*) UserLoadWorkerlist:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetWorkerListURL ] para:pdicinfo ];
}

// 用户创建订单
-(NSString*) GetusercreateorderURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_CREATE_ORDER_URL ];
}

-(NSString*) UserCreateOrder:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetusercreateorderURL ] para:pdicinfo ];
}

// 读取用户历史订单列表
-(NSString*) GetuserordersURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOAD_ORDER_URL ];
}

-(NSString*) UserOrderlistload:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetuserordersURL ] para:pdicinfo ];
}

// 读取用户产品列表
-(NSString*) GetProductsURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOAD_PRODUCTS_URL ];
}

-(NSString*) Productslistload:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetProductsURL ] para:pdicinfo ];
}

// 读取用户服务列表
-(NSString*) GetServicesURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOAD_SERVICES_URL ];
}

-(NSString*) Serviceslistload:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetServicesURL ] para:pdicinfo ];
}

// 用户取消预约
-(NSString*) GetUserCancelOrderURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_CANCEL_ORDER_URL ];
}

-(NSString*) UserCancelOrder:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetUserCancelOrderURL ] para:pdicinfo ];
}

// 用户确认预约
-(NSString*) GetUserConfirmOrderURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_CONFIRM_ORDER_URL ];
}

-(NSString*) UserConfirmOrder:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetUserConfirmOrderURL ] para:pdicinfo ];
}

// 开始施工
-(NSString*) GetOrderBeginURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_BEGIN_ORDER_URL ];
}

-(NSString*) UserOrderBegin:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetOrderBeginURL ] para:pdicinfo ];
}

// 施工结束
-(NSString*) GetOrderFinishURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_FINISH_ORDER_URL ];
}

-(NSString*) UserOrderFinish:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetOrderFinishURL ] para:pdicinfo ];
}

// 预约详细信息
-(NSString*) GetOrderDetailURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_REVIEW_ORDER_URL ];
}

-(NSString*) UserOrderDetail:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetOrderDetailURL ] para:pdicinfo ];
}

// 工人详细信息
-(NSString*) GetWorkerDetailURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_REVIEW_WORKER_URL ];
}

-(NSString*) UserWorkerDetail:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetWorkerDetailURL ] para:pdicinfo ];
}


// 工人抢单列表
-(NSString*) GetWorkerContendURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, WORKER_LOAD_CONTENDS_URL ];
}

-(NSString*) WorkerContend:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetWorkerContendURL ] para:pdicinfo ];
}

// 工人应约
-(NSString*) GetWorkerConfirmContendURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, WORKER_CONFIRM_CONTENDS_URL ];
}

-(NSString*) WorkerConfirmContend:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetWorkerConfirmContendURL ] para:pdicinfo ];
}

// 工人担子记录
-(NSString*) GetWorkerOrdersURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, WORKER_LOAD_ORDER_URL ];
}

-(NSString*) WorkerOrders:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetWorkerOrdersURL ] para:pdicinfo ];
}

// 工人取消担子
-(NSString*) GetWorkerCancelOrderURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, WORKER_CANCEL_ORDER_URL ];
}

-(NSString*) WorkerCancelOrder:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetWorkerCancelOrderURL ] para:pdicinfo ];
}





@end

