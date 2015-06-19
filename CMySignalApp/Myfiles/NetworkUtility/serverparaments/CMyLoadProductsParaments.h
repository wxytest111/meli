//
//  CMyLoadProductsParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

/*
 params: mobile: '1231313123'
 user_type: 2
 token: 'asdfasfd'
 */

@interface CMyLoadProductsParaments : CMyServerParaments
{
    NSString*   smobile;
    NSString*   susertype;
    NSString*   stoken;
}

-(instancetype) initWithdata:(NSString*)mobile type:(NSString*)type token:(NSString*)token;


@end
