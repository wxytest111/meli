//
//  CMyUserLogingViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserLogingViewController.h"



@interface CMyUserLogingViewController ()

@end

@implementation CMyUserLogingViewController

-(instancetype) init
{
    self = [ super init ];
    
    if (self)
    {
        [ self initmyself ];
    }
    
    return self;
}

- (void)initmyself
{
    ploginview = [ [CMyUserLoginView alloc] init ];
    pregisterview = [ CMyUserRegisterView alloc ];

    self.view = ploginview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showregisterview
{
    self.view = pregisterview;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
