//
//  CMyUserLoginParements.m
//  CMySignalApp
//
//  Created by baby on 15/6/15.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserLoginParements.h"

@implementation CMyUserLoginParements


-(instancetype) initWitData:(NSString*)phone pwd:(NSString*)passwd type:(NSString*)type
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:phone pwd:passwd type:type ];
    }
    
    return self;
}

-(void) setdata:(NSString*)phone pwd:(NSString*)passwd type:(NSString*)type
{
    sphone = [ NSString stringWithString:phone ];
    spasswd = [ NSString stringWithString:passwd ];
    stype = [ NSString stringWithString:type ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    [ pretdic setValue:sphone     forKey:USER_LOGIN_PARA_USERNAME ];
    [ pretdic setValue:spasswd   forKey:USER_LOGIN_PARA_USERPWD ];
    [ pretdic setValue:stype      forKey:USER_LOGIN_PARA_TYPE ];
    
    return pretdic;
}





@end
