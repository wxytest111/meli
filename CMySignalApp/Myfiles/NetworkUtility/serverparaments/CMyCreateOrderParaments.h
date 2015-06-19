//
//  CMyCreateOrderParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerParaments.h"

/*
 appointments/make
 params: customer_id: 'asfasfasfdasdf'
 user_type: 1
 token: 'asdfasfd'
 worker_id: 'asfasfasf' 或者为空
 date: '2015-05-05'
 start_time: '09:00'
 end_time: '10:00'
 address: '西安市莲湖路16号'
 product_id: 1 三个产品
 service_id: 1 1->99 2->59
 */

@interface CMyCreateOrderParaments : CMyServerParaments
{
    NSString*   smobile;
    NSString*   stoken;
    NSString*   susertype;
    
    NSString*   stime;
    NSString*   sproduct;
    NSString*   sservice;
    NSString*   saddress;
    
    NSString*   sworkerid;
}

-(instancetype) initWithdata:(NSString*)mobile token:(NSString*)token type:(NSString*)type time:(NSString*)time product:(NSString*)product service:(NSString*)service address:(NSString*)address worker:(NSString*)worker;


@end
