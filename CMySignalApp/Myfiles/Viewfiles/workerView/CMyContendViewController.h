//
//  CMyContendViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMyContendViewController : UIViewController < UITableViewDataSource, UITableViewDelegate >
{
    UITableView* ptableview;
    
    NSMutableArray*     pcontendlist;
    
    NSTimer*        ptimeradd;
    NSTimer*        ptimerdelete;
    
    NSInteger       index;
}

-(void) loadcontendlist;

-(void) loadcontends;
-(void) starttimer;
-(void) stoptimer;
-(void) addcontend;
-(void) deletecontend;

@end
