//
//  CMyReviewWorkerParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyReviewWorkerParaments : CMyServerParaments
{
    NSString*   smobile;
    NSString*   susertype;
    NSString*   stoken;
    NSString*   sworker;
}

-(instancetype) initWithData:(NSString*)worker;



@end
