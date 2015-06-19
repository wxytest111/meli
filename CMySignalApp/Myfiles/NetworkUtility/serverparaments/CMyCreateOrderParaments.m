//
//  CMyCreateOrderParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyCreateOrderParaments.h"

@implementation CMyCreateOrderParaments

-(instancetype) initWithdata:(NSString*)mobile token:(NSString*)token type:(NSString*)type time:(NSString*)time product:(NSString*)product service:(NSString*)service address:(NSString*)address worker:(NSString*)worker
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:mobile token:token type:type time:time product:product service:service address:address worker:worker ];
    }
    
    return self;
}

-(void) setdata:(NSString*)mobile token:(NSString*)token type:(NSString*)type time:(NSString*)time product:(NSString*)product service:(NSString*)service address:(NSString*)address worker:(NSString*)worker
{
    smobile     = [ NSString stringWithFormat:@"%@", mobile ];
    stoken      = [ NSString stringWithFormat:@"%@", token ];
    sproduct    = [ NSString stringWithFormat:@"%@", product ];
    sservice    = [ NSString stringWithFormat:@"%@", service ];
    saddress    = [ NSString stringWithFormat:@"%@", address ];
    stime       = [ NSString stringWithFormat:@"%@", time ];
    susertype   = [ NSString stringWithFormat:@"%@", type ];
    sworkerid   = [ NSString stringWithFormat:@"%@", worker ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    NSArray* times = [ stime componentsSeparatedByString:@" " ];
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:smobile     forKey:USER_CREATE_ORDERS_PARA_USERPHONE ];
    [ pretdic setValue:stoken      forKey:USER_CREATE_ORDERS_PARA_USERTOKEN ];
    [ pretdic setValue:susertype   forKey:USER_CREATE_ORDERS_PARA_USERTYPE ];
    
    [ pretdic setValue:sproduct   forKey:USER_CREATE_ORDERS_PARA_PRODUCT ];
    [ pretdic setValue:sservice   forKey:USER_CREATE_ORDERS_PARA_SERVICE ];
    [ pretdic setValue:[times objectAtIndex:0]      forKey:USER_CREATE_ORDERS_PARA_TIME ];
    [ pretdic setValue:[times objectAtIndex:1]       forKey:USER_CREATE_ORDERS_PARA_TIME_B ];
    [ pretdic setValue:[times objectAtIndex:2]       forKey:USER_CREATE_ORDERS_PARA_TIME_E ];
    [ pretdic setValue:saddress   forKey:USER_CREATE_ORDERS_PARA_ADDRESS ];
    [ pretdic setValue:sworkerid  forKey:USER_CREATE_ORDERS_PARA_WORKERID ];
    [ pretdic setValue:@"start"  forKey:USER_CREATE_ORDERS_PARA_STATUS ];
    return pretdic;
}

@end
