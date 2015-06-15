//
//  CMyUserRegisterParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserRegisterParaments.h"

@implementation CMyUserRegisterParaments

-(instancetype) initWithData:(NSString*)sphone pwd:(NSString*)spwd code:(NSString*)scode type:(NSString*)stype
{
    self = [ self initWithMyself ];
    
    if (self)
    {
        [ self setdata:sphone passwd:spwd code:scode type:stype ];
    }
    return self;
}


-(void) setdata:(NSString*)sphone passwd:(NSString*)spwd code:(NSString*)scode type:(NSString*)stype
{
    assert(sphone);
    assert(spwd);
    assert(scode);
    assert(stype);
    
    suserphone = [ [NSString alloc] initWithString:sphone ];
    suserpwd   = [ [NSString alloc] initWithString:spwd ];
    smsgcode   = [ [NSString alloc] initWithString:scode ];
    susertype  = [ [NSString alloc] initWithString:stype ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:suserphone  forKey:USER_REGISTER_PARA_USERPHONE ];
    [ pretdic setValue:suserpwd    forKey:USER_REGISTER_PARA_USERPWD ];
    [ pretdic setValue:smsgcode    forKey:USER_REGISTER_PARA_MSGCODE ];
    [ pretdic setValue:susertype   forKey:USER_TOKEN_PARA_USERTYPE ];
    return (NSDictionary*)pretdic;
}

@end
