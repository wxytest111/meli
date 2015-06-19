//
//  CMyUserLoadordersParaments.h
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyUserLoadordersParaments : CMyServerParaments
{
    NSString*   suserphone;
    NSString*   stoken;
    NSString*   susertype;
    NSString*   spage;
}

-(instancetype) initWithdata:(NSString*)userid type:(NSString*)type token:(NSString*)token page:(NSInteger)page;
-(void) setdata:(NSString*)userid type:(NSString*)type token:(NSString*)token page:(NSInteger)page;


@end
