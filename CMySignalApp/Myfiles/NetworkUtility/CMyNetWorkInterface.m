//
//  CMyNetWorkInterface.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
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
    return [ prequest responseString ];
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

// 读取用户历史订单列表
-(NSString*) GetuserordersURL
{
    return [ [NSString alloc] initWithFormat:@"%@%@", SERVER_BASE_URL, USER_LOAD_ORDER_URL ];
}

-(NSString*) UserOrderlistload:(NSDictionary*)pdicinfo
{
    return [ self ModuleServerRequest:[ self GetuserordersURL ] para:pdicinfo ];
}




@end

