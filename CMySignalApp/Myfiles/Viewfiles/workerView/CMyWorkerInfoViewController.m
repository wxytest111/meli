//
//  CMyWorkerInfoViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerInfoViewController.h"

@interface CMyWorkerInfoViewController ()

@end

@implementation CMyWorkerInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        self.title = @"我的信息";
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect arect = self.view.frame;
    [self.view setFrame:CGRectMake(arect.origin.x, arect.origin.y, arect.size.width, arect.size.height-50)];
    CGRect arect1 = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    UIView* pview = [ [UIView alloc] initWithFrame:arect1 ];
    [self.view addSubview:pview];
    [pview setTag:100];
    [ pview setBackgroundColor:[ UIColor grayColor ] ];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
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
