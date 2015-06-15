//
//  CMyUserHistoryViewControler.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

// 用户历史订单界面

@interface CMyUserHistoryViewControler : UIViewController < UITableViewDataSource, UITableViewDelegate >
{
    UITableView*    ptableview;
    
    NSMutableArray* porderlist;
    
    NSInteger       lpage;
}

-(void) loadorders:(NSInteger)page;
-(void) loadorderlist;



@end
