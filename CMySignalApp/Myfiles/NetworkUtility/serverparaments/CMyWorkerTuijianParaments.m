//
//  CMyWorkerTuijianParaments.m
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerTuijianParaments.h"

@implementation CMyWorkerTuijianParaments


-(instancetype) initWithdata:(NSString*)workerid token:(NSString*)token type:(NSString*)stype
{
    self = [ super init ];
    
    if (self)
    {
        [ self initdata:workerid token:token type:stype ];
    }
    return self;
}

-(void) initdata:(NSString*)workerid token:(NSString*)token type:(NSString*)stype
{
    sworkerphone    = [ NSString stringWithString:workerid ];
    stoken          = [ NSString stringWithString:token ];
    sworkertype     = [ NSString stringWithString:stype ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:sworkerphone      forKey:WORKER_LOAD_TUIJIAN_PARA_WORKERPHONE ];
    [ pretdic setValue:sworkertype      forKey:WORKER_LOAD_TUIJIAN_PARA_WORKTYPE ];
    [ pretdic setValue:stoken           forKey:WORKER_LOAD_TUIJIAN_PARA_TOKEN ];
    [ pretdic setValue:@"1"             forKey:WORKER_LOAD_TUIJIAN_PARA_PAGE ];
    return pretdic;
}

@end
