//
//  CMyUserLoginParements.h
//  CMySignalApp
//
//  Created by baby on 15/6/15.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyUserLoginParements : CMyServerParaments
{
    NSString*   sphone;
    NSString*   spasswd;
    NSString*   stype;
}

-(instancetype) initWitData:(NSString*)phone pwd:(NSString*)passwd type:(NSString*)type;

@end
