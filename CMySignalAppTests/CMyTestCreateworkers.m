//
//  CMyTestCreateworkers.m
//  CMySignalApp
//
//  Created by baby on 15/6/16.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyTestCreateworkers.h"

#import "CMyNetWorkInterface.h"


@implementation CMyTestCreateworkers

-(instancetype) init
{
    self = [ super init ];
    
    [ self startcreateworkers ];
    
    return self;
}

-(void) startcreateworkers
{
    NSDate* pdata = [ NSDate date ];
    NSInteger ltime = pdata.timeIntervalSince1970;
    NSDate* pdate3 = [ NSDate dateWithTimeIntervalSinceNow:0 ];
    NSInteger ltime3 = pdate3.timeIntervalSince1970;
    NSDate* pdate2 = [ NSDate dateWithTimeIntervalSinceNow:60*60*24 ];
    NSInteger ltime2 = pdate2.timeIntervalSince1970;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    for (NSInteger i = 0; i < 30; i++)
    {
        NSDate* pdate5 = [ NSDate dateWithTimeIntervalSinceNow:60*60*24*i ];
        NSString* stime = [ dateFormatter stringFromDate:pdate5 ];
        NSLog(@"time is :%@", stime);
    }
    
    NSInteger lrest = ltime2-ltime3;
    NSLog(@"lrest:%ld", lrest);
}


@end
