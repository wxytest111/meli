//
//  CMyUserWorkerViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

// 用户能看到的技师界面

@interface CMyUserWorkerViewController : UIViewController < UITableViewDataSource, UITableViewDelegate >
{
    UITableView*    ptableview;
    
    NSMutableArray* pworkerlist;
    
    NSInteger       lshowpage;
}

-(void) loadworkers:(NSInteger)lpage;
-(void) loadworkerlist;


@end
