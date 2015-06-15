//
//  CMyGetMsgCodeParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyGetMsgCodeParaments.h"

@implementation CMyGetMsgCodeParaments

-(instancetype) initWithData:(NSString*)sphone type:(NSString*)stype
{
    self = [ self initWithMyself ];
    
    if (self)
    {
        [ self setdata:sphone type:stype ];
    }
    return self;
}

-(void) setdata:(NSString*)sphone type:(NSString*)stype
{
    assert(sphone);
    assert(stype);
    
    suserphone = [ [NSString alloc] initWithString:sphone ];
    susertype  = [ [NSString alloc] initWithString:stype ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:suserphone forKey:USER_LOGIN_PARA_USERPHONE ];
    [ pretdic setValue:susertype  forKey:USER_LOGIN_PARA_USERTYPE ];
    return (NSDictionary*)pretdic;
}



@end
