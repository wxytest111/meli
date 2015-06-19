//
//  CMyBeginOrderParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyBeginOrderParaments.h"

#import "CMyLocalDatas.h"

@implementation CMyBeginOrderParaments

-(instancetype) initWithData:(NSString*)orderid
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:orderid ];
    }
    return self;
}

-(void) setdata:(NSString*)orderid
{
    smobile = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    susertype = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ] ];
    stoken = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ] ];
    sorderid = [ NSString stringWithFormat:@"%@", orderid ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    
    [ pretdic setValue:smobile     forKey:USER_BEGIN_ORDER_PARA_USERPHONE ];
    [ pretdic setValue:susertype   forKey:USER_BEGIN_ORDER_PARA_USERTYPE ];
    [ pretdic setValue:stoken      forKey:USER_BEGIN_ORDER_PARA_USERTOKEN ];
    [ pretdic setValue:sorderid    forKey:USER_BEGIN_ORDER_PARA_ORDERID ];
    
    return pretdic;
}

@end
