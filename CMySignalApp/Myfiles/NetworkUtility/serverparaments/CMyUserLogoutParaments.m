//
//  CMyUserLogoutParaments.m
//  CMySignalApp
//
//  Created by baby on 15/6/15.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserLogoutParaments.h"

@implementation CMyUserLogoutParaments

-(instancetype) initWitData:(NSString*)phone token:(NSString*)token type:(NSString*)type
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:phone token:token type:type ];
    }
    
    return self;
}

-(void) setdata:(NSString*)phone token:(NSString*)token type:(NSString*)type
{
    sphone = [ NSString stringWithString:phone ];
    stoken = [ NSString stringWithString:token ];
    stype = [ NSString stringWithString:type ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:sphone     forKey:USER_LOGOUT_PARA_USERNAME ];
    [ pretdic setValue:stoken      forKey:USER_LOGOUT_PARA_TOKEN ];
    [ pretdic setValue:stype      forKey:USER_LOGOUT_PARA_TYPE ];
    
    return pretdic;
}



@end
