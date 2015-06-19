//
//  CMyRefreshTokenParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyRefreshTokenParaments : CMyServerParaments
{
    NSString* soldtoken;
    NSString* susertype;
}

-(instancetype) initWithData:(NSString*)stoken type:(NSString*)stype;

@end
