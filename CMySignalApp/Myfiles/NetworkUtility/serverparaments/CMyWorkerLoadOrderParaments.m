//
//  CMyWorkerLoadOrderParaments.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerLoadOrderParaments.h"

@implementation CMyWorkerLoadOrderParaments

-(instancetype) initWithData:(NSString*)page
{
    self = [ super initWithData ];
    
    if (self)
    {
        [ self setdate:page ];
    }
    
    return self;
}

-(void) setdate:(NSString*)page
{
    spage = [ [NSString alloc] initWithFormat:@"%@", page ];
}


@end
