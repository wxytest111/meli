//
//  CMyWorkerConfirmContendParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerConfirmContendParaments.h"

@implementation CMyWorkerConfirmContendParaments

-(instancetype) initWithData:(NSString*)contend
{
    self = [ super initWithData ];
    
    if (self)
    {
        [ self setdata:contend ];
    }
    
    return self;
}

-(void) setdata:(NSString*)contend
{
    scontend = [ NSString stringWithFormat:@"%@", contend ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    [ super GetServerInterfaceParamens ];
    
    [ pretdic setValue:scontend       forKey:WORKER_BASE_PARA_CONTENDID ];
    
    return pretdic;
}



@end
