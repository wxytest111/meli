//
//  CMyReviewWorkerParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyReviewWorkerParaments.h"

@implementation CMyReviewWorkerParaments



-(instancetype) initWithData:(NSString*)worker
{
    self = [super init];
    
    if (self)
    {
        [ self setdata:worker ];
    }
    
    return self;
}

-(void) setdata:(NSString*)worker
{
    smobile = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    susertype = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ] ];
    stoken = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ] ];
    sworker = [ NSString stringWithFormat:@"%@", worker ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    
    [ pretdic setValue:smobile     forKey:USER_BEGIN_ORDER_PARA_USERPHONE ];
    [ pretdic setValue:susertype   forKey:USER_BEGIN_ORDER_PARA_USERTYPE ];
    [ pretdic setValue:stoken      forKey:USER_BEGIN_ORDER_PARA_USERTOKEN ];
    [ pretdic setValue:sworker    forKey:USER_DETAIL_WORKER_PARA_WORKERID ];
    
    return pretdic;
}




@end
