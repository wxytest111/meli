//
//  BaseNavigationViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#if 0
    [ self setNavigationBarHidden:YES ];
#else
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
//        [ self.navigationBar setBackgroundColor:[ UIColor redColor ] ];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"background3"] forBarMetrics:UIBarMetricsDefault];
    }
#endif
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@implementation UINavigationBar (customBackground)

- (void)drawRect:(CGRect)rect
{
    UIImage *img = [UIImage imageNamed:@"nav_bg_all"];
    [img drawInRect:rect];
}


@end
