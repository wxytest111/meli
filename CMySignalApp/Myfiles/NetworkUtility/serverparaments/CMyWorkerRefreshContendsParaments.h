//
//  CMyWorkerRefreshContendsParaments.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerParaments.h"

@interface CMyWorkerRefreshContendsParaments : CMyWorkerParaments
{
    NSString*       spage;
}

-(instancetype) initWithData:(NSString*)page;

/*
 appointment/recent
 params: worker_id: 'asfasfasfdasdf'
 user_type: 2
 token: 'asdfasfd'
 page: 1
 */



@end
