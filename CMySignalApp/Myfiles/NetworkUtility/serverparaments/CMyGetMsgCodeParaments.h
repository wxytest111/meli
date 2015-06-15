//
//  CMyGetMsgCodeParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyGetMsgCodeParaments : CMyServerParaments
{
    NSString* suserphone;
    NSString* susertype;
}

-(instancetype) initWithData:(NSString*)sphone type:(NSString*)stype;

@end
