//
//  CMyOrderCreateViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyOrderCreateViewController.h"

#import "CMyNetWorkInterface.h"
#import "MainViewControler.h"


@interface CMyOrderCreateViewController ()

@end

@implementation CMyOrderCreateViewController

-(instancetype) initWithItem:(BOOL)bcreatebt worker:(NSDictionary*)worker
{
    pworkerinfo = [ [NSDictionary alloc] initWithDictionary:worker ];
    
    self = [ self initWithItem:bcreatebt ];
    
    return self;
}

-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super initWithItem:bcreatebt ];
    
    if (self)
    {
        sright = [ NSString stringWithFormat:@"%@", @"创建" ];
        
        [ self.view setBackgroundColor:[ UIColor grayColor ] ];
        [ self lineviews ];
    }
    return self;
}

-(void) lineviews
{
    NSInteger lx = 5;
    NSInteger ly = 10;
    
    NSInteger llableheight = 30;
    NSInteger llablewidth = 60;
    
    NSInteger lbtwidth = 80;
    NSInteger lbtheight = 40;
    
    NSInteger llabwidth = ScreenWidth-lx-llablewidth-lx-lbtwidth-lx-lx;
    
    CGRect tr1 = CGRectMake(lx, ly, llablewidth, llableheight);
    plabletime = [ [UILabel alloc ] initWithFrame:tr1];
    [ plabletime setText:@"时间：" ];
    [ self.view addSubview:plabletime ];
    
    CGRect tr2 = CGRectMake(tr1.origin.x+tr1.size.width+lx, ly, llabwidth, llableheight);
    ptime = [ [UILabel alloc ] initWithFrame:tr2];
    [ ptime setText:@"" ];
    [ ptime setBackgroundColor:[ UIColor whiteColor ] ];
    [ self.view addSubview:ptime ];
    
    CGRect tr3 = CGRectMake(tr2.origin.x+tr2.size.width+lx, ly, lbtwidth, lbtheight);
    ptimebt = [ [UIButton alloc] initWithFrame:tr3 ];
    [ ptimebt setTitle:@"选择时间" forState:UIControlStateNormal ];
    [ ptimebt setBackgroundColor:[ UIColor grayColor ] ];
    [ self.view addSubview:ptimebt ];

    ly = ly + lbtheight + lx;
    CGRect ar1 = CGRectMake(lx, ly, llablewidth, llableheight);
    plableaddress = [ [UILabel alloc ] initWithFrame:ar1];
    [ plableaddress setText:@"地址：" ];
    [ self.view addSubview:plableaddress ];
    
    CGRect ar2 = CGRectMake(ar1.origin.x+ar1.size.width+lx, ly, ScreenWidth-ar1.origin.x-ar1.size.width, llableheight);
    paddress = [ [UITextField alloc] initWithFrame:ar2 ];
    [ paddress setPlaceholder:@"陕西省西安市凤城十二路" ];
    [ self.view addSubview:paddress ];
    [ paddress setDelegate:self ];
    
    ly = ly + lbtheight + lx;
    CGRect pr1 = CGRectMake(lx, ly, llablewidth, llableheight);
    plableproduce = [ [UILabel alloc ] initWithFrame:pr1];
    [ plableproduce setText:@"产品：" ];
    [ self.view addSubview:plableproduce ];

    CGRect pr2 = CGRectMake(pr1.origin.x+pr1.size.width+lx, ly, llabwidth, llableheight);
    pproduct = [ [UILabel alloc ] initWithFrame:pr2];
    [ pproduct setText:@"" ]; 
    [ pproduct setBackgroundColor:[ UIColor whiteColor ] ];
    [ self.view addSubview:pproduct ];
    
    CGRect pr3 = CGRectMake(pr2.origin.x+pr2.size.width+lx, ly, lbtwidth, lbtheight);
    pproductbt = [ [UIButton alloc] initWithFrame:pr3 ];
    [ pproductbt setTitle:@"选择产品" forState:UIControlStateNormal ];
    [ ptimebt setBackgroundColor:[ UIColor grayColor ] ];
    [ self.view addSubview:pproductbt ];
    
    ly = ly + lbtheight + lx;
    CGRect sr1 = CGRectMake(lx, ly, llablewidth, llableheight);
    plableservice = [ [UILabel alloc ] initWithFrame:sr1];
    [ plableservice setText:@"服务：" ];
    [ self.view addSubview:plableservice ];
    
    CGRect sr2 = CGRectMake(sr1.origin.x+sr1.size.width+lx, ly, llabwidth, llableheight);
    pservice = [ [UILabel alloc ] initWithFrame:sr2];
    [ pservice setText:@"" ];
    [ pservice setBackgroundColor:[ UIColor whiteColor ] ];
    [ self.view addSubview:pservice ];
    
    CGRect sr3 = CGRectMake(sr2.origin.x+sr2.size.width+lx, ly, lbtwidth, lbtheight);
    pservicebt = [ [UIButton alloc] initWithFrame:sr3 ];
    [ ptimebt setBackgroundColor:[ UIColor grayColor ] ];
    [ pservicebt setTitle:@"选择服务" forState:UIControlStateNormal ];
    [ self.view addSubview:pservicebt ];
    ly = ly + lbtheight + lx;
    
    if (pworkerinfo != nil)
    {
        CGRect workimgrect = CGRectMake(lx, ly, 80, 80);
        pworkerimage = [ [UIImageView alloc] initWithFrame:workimgrect ];
        [ pworkerimage setImage:[ UIImage imageNamed:USER_DEFAULT_IMAGE ] ];
        [ self.view addSubview:pworkerimage ];
        
        CGRect worknamerect = CGRectMake(lx + 80, ly+20, 100, 30);
        pworkername = [ [UILabel alloc] initWithFrame:worknamerect ];
        [ self.view addSubview:pworkername ];
        [ pworkername setText:@"我是工人" ];
    }
    
    [ ptimebt    addTarget:self action:@selector(ClickTimeBt:) forControlEvents:UIControlEventTouchDown ];
    [ pproductbt addTarget:self action:@selector(ClickProductBt:) forControlEvents:UIControlEventTouchDown ];
    [ pservicebt addTarget:self action:@selector(ClickServiceBt:) forControlEvents:UIControlEventTouchDown ];
    [ self addGesture ];
}

-(void) viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];

    CGRect arect3 = CGRectMake(0, 0, ScreenWidth, ContentviewHeight);
    self.view.frame = arect3;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
    
    [self.navigationController popViewControllerAnimated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*) getproducts
{
    products = [ [NSMutableArray alloc] init ];
    NSString* smobile = [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ];
    NSString* susertype = [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ];
    NSString* stoken = [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ];
    CMyLoadProductsParaments* ploadproductparaments = [ [CMyLoadProductsParaments alloc] initWithdata:smobile type:susertype token:stoken ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] Productslistload:[ ploadproductparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ])
    {
        NSArray* parray = (NSArray*)[ pserverresult GetResultData ];
        [ products addObjectsFromArray:parray ];
    }
    
    return products;
}

-(NSArray*) getservices
{
    service = [ [NSMutableArray alloc] init ];
    
    NSString* smobile = [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ];
    NSString* susertype = [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ];
    NSString* stoken = [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ];
    CMyLoadServiceParaments* ploadserviceparaments = [ [CMyLoadServiceParaments alloc] initWithdata:smobile type:susertype token:stoken ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] Serviceslistload:[ ploadserviceparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ])
    {
        NSArray* parray = (NSArray*)[ pserverresult GetResultData ];
        [ service addObjectsFromArray:parray ];
    }
    
    return service;
}


-(NSArray*) getdates
{
    pdatedays = [ [NSMutableArray alloc] init ];
    
    NSDateFormatter* pformater = [ [NSDateFormatter alloc] init ];
    [ pformater setDateFormat: @"yyyy-MM-dd"];
    
    for (NSInteger i= 1; i < 11; i++)
    {
        NSDate* adate = [ NSDate dateWithTimeIntervalSinceNow:(60*60*24)*i ];
        NSString* stime = [ pformater stringFromDate:adate ];
        [pdatedays addObject:stime];
    }
    return pdatedays;
}

-(NSArray*) getzones
{
    pdatezones = [ [NSMutableArray alloc] init ];
    
    [ pdatezones addObject:@"08:00 09:30" ];
    [ pdatezones addObject:@"09:30 11:00" ];
    [ pdatezones addObject:@"11:00 12:30" ];
    [ pdatezones addObject:@"13:30 15:00" ];
    [ pdatezones addObject:@"15:00 16:30" ];
    [ pdatezones addObject:@"16:30 18:00" ];
    [ pdatezones addObject:@"18:00 19:30" ];
    [ pdatezones addObject:@"19:30 21:00" ];
    
    return pdatezones;
}

-(void) ClickTimeBt:(UIButton*)pbt
{
    [ self endinput ];
    
    ltype = 1;
    
    CGRect pickrect = CGRectMake(10, self.view.frame.size.height-260, ScreenWidth-10*2, 80);

    pickview = [ [UIPickerView alloc] initWithFrame:pickrect ];
    [ self.view addSubview:pickview ];
    [ pickview setDelegate:self ];
    [ pickview setDataSource:self ];
    [ pickview setTag:100 ];
    
    [ self getdates ];
    [ self getzones ];
}

-(void) ClickProductBt:(UIButton*)pbt
{
    [ self endinput ];
    ltype = 2;
    
    [ self getproducts ];

    CGRect pickrect = CGRectMake(10, self.view.frame.size.height-260, ScreenWidth-10*2, 80);
    pickview2 = [ [UIPickerView alloc] initWithFrame:pickrect ];
    [ self.view addSubview:pickview2 ];
    [ pickview2 setDelegate:self ];
    [ pickview2 setDataSource:self ];
    [ pickview2 setTag:101 ];
    
}

-(void) ClickServiceBt:(UIButton*)pbt
{
    [ self endinput ];
    
    [ self getservices ];

    ltype = 3;
    CGRect pickrect = CGRectMake(10, self.view.frame.size.height-260, ScreenWidth-10*2, 80);
    pickview3 = [ [UIPickerView alloc] initWithFrame:pickrect ];
    [ self.view addSubview:pickview3 ];
    [ pickview3 setDelegate:self ];
    [ pickview3 setDataSource:self ];
    [ pickview3 setTag:102 ];
    
}

-(void) ClickRightBt:(UIButton*)pbt
{
    [ self endinput ];
    
    NSString* sphone = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    NSString* stoken = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ] ];
    NSString* stype = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ] ];
    NSString* stime = [ NSString stringWithFormat:@"%@", ptime.text ];
    NSString* sproduct = [ NSString stringWithFormat:@"%@", pproduct.text ];
    NSString* sproductid = nil;
    for (NSInteger i = 0; i < products.count; i++ )
    {
        NSDictionary* p = [ products objectAtIndex:i ];
        if ([sproduct isEqualToString:[ NSString stringWithFormat:@"%@", [ p objectForKey:@"name" ] ]])
        {
            sproductid = [ NSString stringWithFormat:@"%@", [ p objectForKey:@"id" ] ];
        }
    }
    
    NSString* sservice = [ NSString stringWithFormat:@"%@", pservice.text ];
    NSString* sserviceid = nil;
    for (NSInteger i = 0; i < service.count; i++ )
    {
        NSDictionary* p = [ service objectAtIndex:i ];
        if ([sservice isEqualToString:[ NSString stringWithFormat:@"%@", [ p objectForKey:@"name" ] ]])
        {
            sserviceid = [ NSString stringWithFormat:@"%@", [ p objectForKey:@"id" ] ];
        }
    }
    
    NSString* sadd = paddress.text;
    if ( sadd.length < 1 )
    {
        sadd = paddress.placeholder;
    }
    
    NSString* saddress = [ NSString stringWithFormat:@"%@", sadd ];
    
    CMyCreateOrderParaments* pcreateparaments = [ [CMyCreateOrderParaments alloc] initWithdata:sphone token:stoken type:stype time:stime product:sproductid service:sserviceid address:saddress worker:@"" ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserCreateOrder:[ pcreateparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ])
    {
        NSLog(@"create order success");
    }
    else
    {
        NSLog(@"create order failed");
    }
    
    if (pworkerinfo)
    {
//        [self.tabBarController setSelectedIndex:2];
//        MainViewControler* pmainview = (MainViewControler*)self.tabBarController;
//        [ pmainview didItemView:nil atIndex:2 ];
        [self.navigationController popViewControllerAnimated:NO];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endinput)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    [self.view addGestureRecognizer:tap];
}

-(void) endinput
{
    [ paddress resignFirstResponder ];
    
    [ UIView beginAnimations:nil context:nil ];
//    if (ltype == 1)
    {
        pickview.top = ScreenHeight+20;
    }
//    else if(ltype == 2)
    {
        pickview2.top = ScreenHeight+20;
    }
//    else
    {
        pickview3.top = ScreenHeight+20;
    }
    [ UIView commitAnimations ];
}

#pragma - UITableViewDelegate

//返回pickerview的组件数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    switch (ltype)
    {
        case 1:
        {
            return 2;
        }
        case 2:
        {
            return 1;
        }
        case 3:
        {
            return 1;
        }
        default:
            break;
    }
    return 0;
}

//返回每个组件上的行数
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (ltype)
    {
        case 1:
        {
            if (component == 0)
            {
                return pdatedays.count;
            }
            else
            {
                return pdatezones.count;
            }
        }
        case 2:
        {
            return products.count;
        }
        case 3:
        {
            return service.count;
        }
        default:
            break;
    }
    return 0;
    

}

//设置每行显示的内容


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString* str = nil;
    
    switch (ltype)
    {
        case 1:
        {
            if (component == 0)
            {
                str = @"日期";
            }
            else
            {
                str = @"时间";
            }
            break;
        }
        case 2:
        {
            str = @"产品";
            break;
        }
        case 3:
        {
            str = @"服务";
            break;
        }
        default:
            break;
    }
    return str;
}

//自定义pickerview使内容显示在每行的中间，默认显示在每行的左边（(NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component）
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    
    NSString* str = nil;
    
    switch (ltype)
    {
        case 1:
        {
            if (component == 0)
            {
                str = [pdatedays objectAtIndex:row];
            }
            else
            {
                str = [pdatezones objectAtIndex:row];
            }
            break;
        }
        case 2:
        {
            NSDictionary* pdic = [ products objectAtIndex:row ];
            str = [ pdic objectForKey:@"name" ];
            break;
        }
        case 3:
        {
            NSDictionary* pdic = [ service objectAtIndex:row ];
            str = [ pdic objectForKey:@"name" ];
            break;
        }
        default:
            break;
    }
    
    label.text = str;
    return label;
}

//当你选中pickerview的某行时会调用该函数。

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (ltype)
    {
        case 1:
        {
            if (component==0)
            {
                lday = row;
            }
            else
            {
                lzone = row;
            }
            
            NSString* sday = [ pdatedays objectAtIndex:lday ];
            NSString* szone = [ pdatezones objectAtIndex:lzone ];
            
            NSString* stime = [ NSString stringWithFormat:@"%@ %@", sday, szone ];
            [ ptime setText:stime ];
            break;
        }
        case 2:
        {
            NSDictionary* pdic = [ products objectAtIndex:row ];
            NSString* str = [ pdic objectForKey:@"name" ];
            [pproduct setText:str];
            break;
        }
        case 3:
        {
            NSDictionary* pdic = [ service objectAtIndex:row ];
            NSString* str = [ pdic objectForKey:@"name" ];
            [pservice setText:str];
            break;
        }
        default:
            break;
    }
}


#pragma mark UITextViewDelegate
// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
}

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [ textField resignFirstResponder ];
    NSLog(@"------%s-----", __FUNCTION__);
}

// return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    [ textField resignFirstResponder ];
    return YES;
}







@end
