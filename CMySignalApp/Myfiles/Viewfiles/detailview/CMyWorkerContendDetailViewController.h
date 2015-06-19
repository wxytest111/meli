//
//  CMyWorkerContendDetailViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "ModuleViewBaseViewController.h"

@interface CMyWorkerContendDetailViewController : ModuleViewBaseViewController
{
    NSDictionary*       pcontendinfo;
    
    UILabel*            plableusername;
    UILabel*            plabletimerange;
    UILabel*            plableaddress;
    UILabel*            plableproduct;
    UILabel*            plableservice;
}

-(instancetype) initWithContend:(NSDictionary*)info;

@end
