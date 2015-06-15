//
//  CMyTuijianDetailViewController.h
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMyTuijianDetailViewController : UIViewController
{
    UIWebView*      pwebview;
    UIButton* pbackbt;
    
    NSString* saddress;
}

-(instancetype) initWithdata:(NSString*)saddres;

-(void) Clickbackbt:(id)sender;


@end
