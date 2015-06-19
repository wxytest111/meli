//
//  CMyUserHistoryViewControler.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModuleViewBaseViewController.h"

// 用户历史订单界面

@interface CMyUserHistoryViewControler : ModuleViewBaseViewController < UITableViewDataSource, UITableViewDelegate >
{
    UITableView*    ptableview;
    
    NSMutableArray* porderlist;
    
    NSInteger       lpage;
}

-(void) loadorders:(NSInteger)page;
-(void) loadorderlist;



@end
