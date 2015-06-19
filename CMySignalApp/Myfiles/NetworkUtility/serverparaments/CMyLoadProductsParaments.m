//
//  CMyLoadProductsParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyLoadProductsParaments.h"

@implementation CMyLoadProductsParaments


-(instancetype) initWithdata:(NSString*)mobile type:(NSString*)type token:(NSString*)token
{
    self = [ super init ];
    
    if (self)
    {
        [ self setdata:mobile type:type token:token ];
    }
    
    return self;
}

-(void) setdata:(NSString*)mobile type:(NSString*)type token:(NSString*)token
{
    smobile = [ NSString stringWithFormat:@"%@", mobile ];
    susertype = [ NSString stringWithFormat:@"%@", type ];
    stoken = [ NSString stringWithFormat:@"%@", token ];
}

-(NSDictionary*) GetServerInterfaceParamens
{
    pretdic = [ [NSMutableDictionary alloc] init ];
    
    [ pretdic setValue:smobile     forKey:USER_LOAD_PRODUCT_PARA_USERPHONE ];
    [ pretdic setValue:stoken      forKey:USER_LOAD_PRODUCT_PARA_USERTYPE ];
    [ pretdic setValue:susertype   forKey:USER_LOAD_PRODUCT_PARA_USERTOKEN ];
    
    return pretdic;
}



@end
