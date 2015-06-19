//
//  CMyOrderDetailParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyOrderDetailParaments.h"

@implementation CMyOrderDetailParaments

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    
    [ pretdic setValue:smobile     forKey:USER_BEGIN_ORDER_PARA_USERPHONE ];
    [ pretdic setValue:susertype   forKey:USER_BEGIN_ORDER_PARA_USERTYPE ];
    [ pretdic setValue:stoken      forKey:USER_BEGIN_ORDER_PARA_USERTOKEN ];
    [ pretdic setValue:sorderid    forKey:USER_BEGIN_ORDER_PARA_ORDERID ];
    [ pretdic setValue:@"1"        forKey:USER_BEGIN_ORDER_PARA_ORDERID ];
    return pretdic;
}


@end
