//
//  CMyLoadWorkersParaments.h
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyLoadWorkersParaments : CMyServerParaments
{
    NSString*   suserid;
    NSString*   susertype;
    NSString*   stoken;
    NSString*   spage;
}

-(instancetype) initWithdata:(NSString*)userid type:(NSString*)stype token:(NSString*)token page:(NSString*)page;



@end
