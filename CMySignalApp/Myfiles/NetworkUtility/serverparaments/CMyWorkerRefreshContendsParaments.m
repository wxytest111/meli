//
//  CMyWorkerRefreshContendsParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerRefreshContendsParaments.h"

@implementation CMyWorkerRefreshContendsParaments

-(instancetype) initWithData:(NSString*)page
{
    self = [ super initWithData ];
    
    if (self)
    {
        [ self setdata:page ];
    }
    
    return self;
}

-(void) setdata:(NSString*)page
{
    spage = [ NSString stringWithFormat:@"%@", page ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    [ super GetServerInterfaceParamens ];
    
    [ pretdic setValue:spage       forKey:WORKER_BASE_PARA_PAGE ];
    
    return pretdic;
}



@end
