//
//  CMyWorkerParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerParaments.h"




@implementation CMyWorkerParaments

-(instancetype) initWithData
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata ];
    }
    
    return self;
}

-(void) setdata
{
    smobile = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    stoken  = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ] ];
    stype   = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ] ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    
    [ pretdic setValue:smobile     forKey:WORKER_BASE_PARA_PHONE ];
    [ pretdic setValue:stoken      forKey:WORKER_BASE_PARA_TOKEN ];
    [ pretdic setValue:stype       forKey:WORKER_BASE_PARA_TYPE ];
    
    return pretdic;
}



@end
