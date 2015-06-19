//
//  CMyUserConfirmOrderParaments.h
//  CMySignalApp
//
//  Created by baby on 15/6/19.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyBeginOrderParaments.h"

@interface CMyUserConfirmOrderParaments : CMyBeginOrderParaments
{
    NSString*   sworkerid;
}

-(instancetype) initWithData:(NSString*)orderid worker:(NSString*)workerid;

@end
