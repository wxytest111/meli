//
//  CMyWorkerTuijianParaments.m
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerTuijianParaments.h"

@implementation CMyWorkerTuijianParaments


-(instancetype) initWithdata:(NSString*)workerid type:(NSString*)stype
{
    self = [ super init ];
    
    if (self)
    {
        [ self initdata:workerid type:stype ];
    }
    return self;
}

-(void) initdata:(NSString*)workerid type:(NSString*)stype
{
    sworkerid = [ NSString stringWithString:workerid ];
    sworkertype = [ NSString stringWithString:stype ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:sworkertype      forKey:WORKER_LOAD_TUIJIAN_PARA_WORKERID ];
    [ pretdic setValue:sworkertype      forKey:WORKER_LOAD_TUIJIAN_PARA_WORKTYPE ];
    return pretdic;
}

@end
