//
//  CMyRefreshTokenParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyRefreshTokenParaments.h"

@implementation CMyRefreshTokenParaments

-(instancetype) initWithData:(NSString*)stoken type:(NSString*)stype
{
    self = [ self initWithMyself ];
    
    if (self)
    {
        [ self setdata:stoken type:stype ];
    }
    return self;
}

-(void) setdata:(NSString*)stoken type:(NSString*)stype
{
    assert(stoken);
    assert(stype);
    
    soldtoken = [ [NSString alloc] initWithString:stoken ];
    susertype = [ [NSString alloc] initWithString:stype ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:soldtoken  forKey:USER_TOKEN_PARA_OLD ];
    [ pretdic setValue:susertype  forKey:USER_TOKEN_PARA_USERTYPE ];
    return (NSDictionary*)pretdic;
}


@end
