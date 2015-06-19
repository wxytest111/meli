//
//  CMyWorkerTuijianParaments.h
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyWorkerTuijianParaments : CMyServerParaments
{
    NSString* sworkerphone;
    NSString* sworkertype;
    NSString* stoken;
}

-(instancetype) initWithdata:(NSString*)workerid token:(NSString*)token type:(NSString*)stype;

@end
