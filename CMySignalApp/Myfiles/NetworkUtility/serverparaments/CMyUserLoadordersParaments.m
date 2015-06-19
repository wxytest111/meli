//
//  CMyUserLoadordersParaments.m
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserLoadordersParaments.h"

@implementation CMyUserLoadordersParaments

-(instancetype) initWithdata:(NSString*)userid type:(NSString*)type token:(NSString*)token page:(NSInteger)page
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:userid type:type token:token page:page ];
    }
    return self;
}

-(void) setdata:(NSString*)userid type:(NSString*)type token:(NSString*)token page:(NSInteger)page
{
    suserphone = [ [NSString alloc] initWithString:userid ];
    susertype = [ [NSString alloc] initWithString:type ];
    stoken = [ [NSString alloc] initWithString:token ];
    spage = [ [NSString alloc] initWithFormat:@"%ld", page ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:suserphone     forKey:USER_LOAD_ORDERS_PARA_USERPHONE ];
    [ pretdic setValue:susertype   forKey:USER_LOAD_ORDERS_PARA_USERTYPE ];
    [ pretdic setValue:stoken      forKey:USER_LOAD_ORDERS_PARA_USERTOKEN ];
    [ pretdic setValue:spage       forKey:USER_LOAD_ORDERS_PARA_USERPAGE ];
    
    return pretdic;
}





@end
