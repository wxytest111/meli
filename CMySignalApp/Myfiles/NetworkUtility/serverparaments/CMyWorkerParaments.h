//
//  CMyWorkerParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

@interface CMyWorkerParaments : CMyServerParaments
{
    NSString*       smobile;
    NSString*       stoken;
    NSString*       stype;
    
}

-(instancetype) initWithData;



@end
