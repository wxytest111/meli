//
//  CMyBeginOrderParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyBeginOrderParaments : CMyServerParaments
{
    NSString*   smobile;
    NSString*   susertype;
    NSString*   stoken;
    NSString*   sorderid;
}

-(instancetype) initWithData:(NSString*)orderid;


@end
