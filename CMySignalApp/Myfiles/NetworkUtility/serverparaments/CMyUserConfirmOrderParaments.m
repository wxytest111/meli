//
//  CMyUserConfirmOrderParaments.m
//  CMySignalApp
//
//  Created by baby on 15/6/19.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserConfirmOrderParaments.h"

@implementation CMyUserConfirmOrderParaments

-(instancetype) initWithData:(NSString*)orderid worker:(NSString*)workerid
{
    self = [ super initWithData:orderid ];
    
    if (self)
    {
        [ self setdata:workerid ];
    }
    
    return self;
}

-(void) setdata:(NSString*)workerid
{
    sworkerid = [ NSString stringWithFormat:@"%@", workerid ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    [ super GetServerInterfaceParamens ];

    [ pretdic setValue:sworkerid    forKey:USER_CONFIRM_ORDER_PARA_WORKERID ];
    
    return pretdic;
}



@end
