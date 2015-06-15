//
//  CMyLoadWorkersParaments.m
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyLoadWorkersParaments.h"

@implementation CMyLoadWorkersParaments

-(instancetype) initWithdata:(NSString*)userid type:(NSString*)stype token:(NSString*)token page:(NSString*)page
{
    self = [ super init ];
    
    if (self)
    {
        [ self initdata:userid type:stype token:token page:page ];
    }
    
    return self;
}

-(void) initdata:(NSString*)userid type:(NSString*)stype token:(NSString*)token page:(NSString*)page
{
    suserid = [ [NSString alloc] initWithString:userid ];
    susertype = [ [NSString alloc] initWithString:stype ];
    stoken = [ [NSString alloc] initWithString:token ];
    spage = [ [NSString alloc] initWithString:page ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:suserid      forKey:USER_LOAD_WORKERS_PARA_USERID ];
    [ pretdic setValue:susertype      forKey:USER_LOAD_WORKERS_PARA_USERTYPE ];
    [ pretdic setValue:stoken      forKey:USER_LOAD_WORKERS_PARA_USERTOKEN ];
    [ pretdic setValue:spage      forKey:USER_LOAD_WORKERS_PARA_USERPAGE ];

    return pretdic;
}

@end
