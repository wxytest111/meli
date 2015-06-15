//
//  CMyServerParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@implementation CMyServerParaments

-(instancetype) initWithMyself
{
    self = [ super init ];
    
    return self;
}

-(NSString*) GetToken
{
    return @"token";
}

-(NSString*) GetUserID
{
    return @"userid";
}


-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:[ self GetToken ]       forKey:USER_ALL_PUBLIC_PARA_TOKEN ];
    [ pretdic setValue:[ self GetUserID ]      forKey:USER_ALL_PUBLIC_PARA_USERID ];
    return pretdic;
}


@end
