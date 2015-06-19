//
//  CMyWorkerLoadOrderParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerParaments.h"

@interface CMyWorkerLoadOrderParaments : CMyWorkerParaments
{
    NSString* spage;
}

-(instancetype) initWithData:(NSString*)page;

@end
