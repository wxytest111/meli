//
//  CMyUserCancelOrderParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyLoadProductsParaments.h"

@interface CMyUserCancelOrderParaments : CMyLoadProductsParaments
{
    NSString* sorderid;
}

-(instancetype) initWithdata:(NSString *)mobile type:(NSString *)type token:(NSString *)token id:(NSString*)orderid;


@end
