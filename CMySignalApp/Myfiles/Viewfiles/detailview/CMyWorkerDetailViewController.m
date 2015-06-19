//
//  CMyWorkerDetailViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerDetailViewController.h"
#import "CMyCreateOderViewController.h"

#import "CMyNetWorkInterface.h"

#import "CMyOrderCreateViewController.h"
#import "CMyOrderCreateViewController.h"


@interface CMyWorkerDetailViewController ()

@end

@implementation CMyWorkerDetailViewController

-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super initWithItem:bcreatebt ];
    
    if (self)
    {
        sright = [ NSString stringWithFormat:@"%@", @"约她" ];
        border = NO;
    }
    return self;
}


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
}

-(void) viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
    if (border)
    {
        ;
    }
    else
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
//  [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
    
    CGRect arect3 = CGRectMake(0, 0, ScreenWidth, ContentviewHeight);
    self.view.frame = arect3;
    
    NSInteger lableheight = 30;
    CGRect arect = self.view.frame;
    
    CGRect scrlrect = CGRectMake(0, 0, arect.size.width, arect.size.height);
    pscrolview.frame = scrlrect;
    
    CGRect imagerect = CGRectMake(5, 5, arect.size.width-20, arect.size.width-20);
    pimageview.frame = imagerect;
    
    CGRect namerect = CGRectMake(10, imagerect.origin.y+imagerect.size.height+10, arect.size.width-20, lableheight);
    plablename.frame = namerect;
    
    CGRect startrect = CGRectMake(10, namerect.origin.y+namerect.size.height+10, arect.size.width-20, lableheight);
    plablestarts.frame = startrect;
    
    CGRect skillrect = CGRectMake(10, startrect.origin.y+namerect.size.height+10, arect.size.width-20, lableheight*2);
    plableskill.frame = skillrect;
    
    CGRect descrect = CGRectMake(10, skillrect.origin.y+skillrect.size.height+10, arect.size.width-20, lableheight*2);
    plabledesc.frame = descrect;
    
    arect.size.height = descrect.origin.y + descrect.size.height + 20;
    pscrolview.contentSize = arect.size;
}

-(void) ClickRightBt:(UIButton*)pbt
{
    border = YES;
    NSLog(@"ClickRightBt");
    CMyOrderCreateViewController* pcreateorder = [ [CMyOrderCreateViewController alloc] initWithItem:YES worker:pworkerinfo ];
    [ self.navigationController pushViewController:pcreateorder animated:YES ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) lineviews
{
    pscrolview = [ [UIScrollView alloc] init ];
    [ self.view addSubview:pscrolview ];
    [ pscrolview setBackgroundColor:[ UIColor grayColor ] ];
//    [ self.view setBackgroundColor:[ UIColor grayColor ] ];

    NSString* simage = [ NSString stringWithFormat:@"姓名：%@", [pworkerinfo objectForKey:@"id"] ];
    //    pimageview = [ [UIImageView alloc] initWithImage:[ UIImage imageNamed:simage ] ];
    pimageview = [ [UIImageView alloc] initWithImage:[ UIImage imageNamed:USER_DEFAULT_IMAGE ] ];
    [ pscrolview addSubview:pimageview ];
    
    NSString* sname = [ NSString stringWithFormat:@"姓名：%@", [pworkerinfo objectForKey:@"name"] ];
    plablename = [ [UILabel alloc] init ];
    [ plablename setText:sname];
    [ plablename setTextAlignment:NSTextAlignmentLeft ];
    [ pscrolview addSubview:plablename];
    
    NSString* sstarts = [ NSString stringWithFormat:@"评分：%@", [pworkerinfo objectForKey:@"star"] ];
    plablestarts = [ [UILabel alloc] init ];
    [ plablestarts setText:sstarts];
    [ plablestarts setTextAlignment:NSTextAlignmentLeft ];
    [ pscrolview addSubview:plablestarts];
    
    NSString* sdesc = [ NSString stringWithFormat:@"自我描述：%@%@", [pworkerinfo objectForKey:@"description"], [pworkerinfo objectForKey:@"description"] ];
    plabledesc = [ [UILabel alloc] init ];
    [ plabledesc setText:sdesc];
    [ plabledesc setNumberOfLines:0 ];
    [ plabledesc setTextAlignment:NSTextAlignmentLeft ];
    [ pscrolview addSubview:plabledesc];
    
    NSString* sskill = [ NSString stringWithFormat:@"技术：%@%@", [pworkerinfo objectForKey:@"skill"],[pworkerinfo objectForKey:@"skill"] ];
    plableskill = [ [UILabel alloc] init ];
    [ plableskill setText:sskill];
    [ plableskill setNumberOfLines:0 ];
    [ plableskill setTextAlignment:NSTextAlignmentLeft ];
    [ pscrolview addSubview:plableskill];
}

-(void) setworker:(NSDictionary*)pdic
{
    pworkerinfo = [ [NSDictionary alloc] initWithDictionary:pdic ];
    [ self lineviews ];
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
