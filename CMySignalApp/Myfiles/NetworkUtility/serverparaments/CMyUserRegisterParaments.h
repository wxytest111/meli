//
//  CMyUserRegisterParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyUserRegisterParaments : CMyServerParaments
{
    NSString*   suserphone;
    NSString*   suserpwd;
    NSString*   smsgcode;
    NSString*   susertype;
}

-(instancetype) initWithData:(NSString*)sphone pwd:(NSString*)spwd code:(NSString*)scode type:(NSString*)stype;

@end
