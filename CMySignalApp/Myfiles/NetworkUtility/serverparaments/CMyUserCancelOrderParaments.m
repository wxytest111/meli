//
//  CMyUserCancelOrderParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserCancelOrderParaments.h"

@implementation CMyUserCancelOrderParaments

-(instancetype) initWithdata:(NSString *)mobile type:(NSString *)type token:(NSString *)token id:(NSString*)orderid
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:mobile type:type token:token id:orderid ];
    }
    
    return self;
}

-(void) setdata:(NSString *)mobile type:(NSString *)type token:(NSString *)token id:(NSString*)orderid
{
    smobile = [ NSString stringWithFormat:@"%@", mobile ];
    susertype = [ NSString stringWithFormat:@"%@", type ];
    stoken = [ NSString stringWithFormat:@"%@", token ];
    sorderid = [ NSString stringWithFormat:@"%@", orderid ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    
    [ pretdic setValue:smobile     forKey:USER_CANCEL_ORDER_PARA_USERPHONE ];
    [ pretdic setValue:stoken      forKey:USER_CANCEL_ORDER_PARA_USERTOKEN ];
    [ pretdic setValue:susertype   forKey:USER_CANCEL_ORDER_PARA_USERTYPE ];
    [ pretdic setValue:sorderid    forKey:USER_CANCEL_ORDER_PARA_ORDERID ];
    
    return pretdic;
}






@end
