//
//  CMyUserLogoutParaments.h
//  CMySignalApp
//
//  Created by baby on 15/6/15.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyUserLogoutParaments : CMyServerParaments
{
    NSString*   sphone;
    NSString*   stoken;
    NSString*   stype;
}

-(instancetype) initWitData:(NSString*)phone token:(NSString*)token type:(NSString*)type;



@end
