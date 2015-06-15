//
//  CMyCreateOderViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyCreateOderViewController.h"

@interface CMyCreateOderViewController ()

@end

@implementation CMyCreateOderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    psubmitbt = [ [UIButton alloc] init ];
    [ psubmitbt addTarget:self action:@selector(ClickSubmitbt:) forControlEvents:UIControlEventTouchUpInside ];
    [ psubmitbt setTitle:@"submit" forState:UIControlStateNormal ];
    [ psubmitbt setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ self.view addSubview:psubmitbt ];
    
    pcancelbt = [ [UIButton alloc] init ];
    [ pcancelbt addTarget:self action:@selector(ClickCancelbt:) forControlEvents:UIControlEventTouchUpInside ];
    [ pcancelbt setTitle:@"cancel" forState:UIControlStateNormal ];
    [ pcancelbt setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ self.view addSubview:pcancelbt ];
    
    [self.view setBackgroundColor:[ UIColor grayColor ]];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect cancelrect = CGRectMake(30, 30, 90, 30);
    [pcancelbt setFrame:cancelrect];
    
    CGRect arect = self.view.frame;
    CGRect submitrect = CGRectMake(arect.size.width-90-20, 30, 90, 30);
    [ psubmitbt setFrame:submitrect ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) submitorder
{
    ;
}

-(void) ClickSubmitbt:(id)sender
{
    [ self submitorder ];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) ClickCancelbt:(id)sender
{
    [ self dismissViewControllerAnimated:YES completion:nil ];
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
