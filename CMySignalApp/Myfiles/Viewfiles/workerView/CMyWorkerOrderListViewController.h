//
//  CMyWorkerOrderListViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "globaldefine.h"

@interface CMyWorkerOrderListViewController : UIViewController  < UITableViewDataSource, UITableViewDelegate >
{
    UITableView* ptableview;
    
    NSMutableArray* pworkerorderlist;
}

-(void) loadworkerorderlist;

@end
