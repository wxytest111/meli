//
//  CMyReviewOrderViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "ModuleViewBaseViewController.h"

@interface CMyReviewOrderViewController : ModuleViewBaseViewController< UITableViewDataSource, UITableViewDelegate >
{
    UITableView* ptableview;
    
    UILabel*    plabletime;
    UILabel*    plableaddress;
    UILabel*    plableproduct;
    UILabel*    plableservice;
    
    UIButton*   pBeginBt;
    
    
    NSMutableDictionary*   pdicinfo;
    NSInteger  lstatus;
    NSString*   sstatus;
    
    NSArray* pworkers;
}

-(instancetype) initWithItem:(BOOL)bcreatebt info:(NSDictionary*)dicinfo;
-(void) setorderinfo:(NSDictionary*)dicinfo;



@end
