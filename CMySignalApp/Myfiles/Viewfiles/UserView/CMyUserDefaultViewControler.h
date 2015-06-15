//
//  CMyUserDefaultViewControler.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CMyNetWorkInterface.h"

#import "CMyTableViewCell.h"

// 用户首页界面

@interface CMyUserDefaultViewControler : UIViewController < UITableViewDataSource, UITableViewDelegate >
{
    UITableView*    ptableview;
    
    NSMutableArray*     ptableviewdata;
    NSMutableDictionary*   pviewdata;
}

-(void) loadshowdata;

-(CMyTableViewCell*) CreateCellView:(CGRect) arect index:(NSInteger)lindex;

-(NSInteger) getcellviewtype:(NSInteger)lindex;
-(NSDictionary*) getcellviewdata:(NSInteger)lindex;

-(void) loadtuijiandata;


@end
