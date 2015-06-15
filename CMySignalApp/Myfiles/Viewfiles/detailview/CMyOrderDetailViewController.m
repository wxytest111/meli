//
//  CMyOrderDetailViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyOrderDetailViewController.h"

@interface CMyOrderDetailViewController ()

@end

@implementation CMyOrderDetailViewController

- (instancetype)init
{
    self  = [ super init ];
    
    if (self)
    {
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ self.view setBackgroundColor:[ UIColor grayColor ] ];
    
    pbackbt = [ [UIButton alloc] init ];
    [ pbackbt setTitle:@"返回" forState:UIControlStateNormal ];
    [ pbackbt setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbackbt addTarget:self action:@selector(ClickBackBt:) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:pbackbt];

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect backrect = CGRectMake(30, 30, 50, 30);
    [pbackbt setFrame:backrect];
    
    CGRect lablerect = CGRectMake(10, 200, self.view.frame.size.width-10*2, 50);
    UILabel*    plable = [ [UILabel alloc] init ];
    [ plable setFrame:lablerect ];
    [ plable setText:@"this is order detail view" ];
    [ plable setTextAlignment:NSTextAlignmentCenter ];
    [ self.view addSubview:plable ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) ClickBackBt:(id)sender
{
    [ self dismissViewControllerAnimated:YES completion:nil ];
}

-(void) setorderinfo:(NSDictionary*)porder
{
    porderinfo = porder;
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
