//
//  ViewController.m
//  ios
//
//  Created by SunSet on 2017/6/8.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "ViewController.h"
//#import <SSBaseLib.h>
#import "AMDBaseViewModel.h"
#import "SSJSONModel.h"
#import "SSJSONValueTransformer.h"
#import "SSImageTool.h"
#import "SSFPSControl.h"
#import "SSEncryptSignTool.h"
#import "UIImage+FixOrientation.h"
#import "NSString+Price.h"

@interface ViewController ()<SSFPSControlDelegate>
{
    SSFPSControl *_fpsControl;
    __weak UILabel *_fpsLabel;     //
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test2];
//    [self testFps];
//    [self test3];
//    [self test4];
    [self test5];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)test
{
//    AMDBaseModel *model = [[AMDBaseModel alloc]initWithDictionary:@{@"a":@"asd"} error:nil];
//    AMDBaseModel *model = [[AMDBaseModel alloc]init];
//    NSLog(@"%@",model);
//    SSJSONValueTransformer *transformer = [[SSJSONValueTransformer alloc]init];
//    NSLog(@"  %@ ",transformer);
//    SSJSONModel *model = [[SSJSONModel alloc]init];
//    AMDBaseViewModel *viewmodel = [[AMDBaseViewModel alloc]init];
//    SSJSONKeyMapper *mapper = [[SSJSONKeyMapper alloc]init];
}


- (void)test2
{
    CGSize size = CGSizeMake(475, 690);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    imageView.layer.borderWidth = 1;
    
    // 裁剪
    UIImage *originimage = [UIImage imageNamed:@"111.jpg"];
    UIImage *clipimage = [SSImageTool clipWithSize:size clipType:1 image:originimage];
    imageView.image = clipimage;
}


- (void)testFps
{
    if (_fpsControl == nil) {
        _fpsControl = [[SSFPSControl alloc]init];
        _fpsControl.delegate = self;
    }
    
    UILabel *fpslb = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 40, 30)];
    fpslb.backgroundColor = [UIColor blackColor];
    fpslb.textAlignment = NSTextAlignmentCenter;
    fpslb.textColor = [UIColor whiteColor];
    fpslb.layer.cornerRadius = 3;
    fpslb.layer.masksToBounds = YES;
    [self.view addSubview:fpslb];
    _fpsLabel = fpslb;
}


#pragma mark - SSFPSControlDelegate
//
- (void)control:(SSFPSControl *)control NSInteger:(NSInteger)fps
{
    _fpsLabel.text = [[NSString alloc]initWithFormat:@"%li",(long)fps];
}


#pragma mark - private api
//
- (void)test3
{
    NSString *secret = @"secret";
    NSString *string = @"阿斯顿发无二翁asdddddasd";
    
    NSString *resault = [SSEncryptSignTool encryptAES:string secret:secret];
    NSString *value = [SSEncryptSignTool dencryptAES:resault secret:secret];
    NSLog(@" 加密结果：%@，解密结果：%@ ",resault, value);
}


- (void)test4
{
    UIImage *image = [UIImage imageNamed:@"111.jpg"];
    NSLog(@" 压缩前的图为%@ ",image);
    UIImage *newImage = [image zipWithMaxLength:200*1024];
    NSLog(@" 压缩后的图为%@ ",newImage);
}

- (void)test5{
    NSString *a = @"12.23";
    NSLog(@"%@", [a p_delUnnecessaryZero]);
    NSString *a1 = @"12.00";
    NSLog(@"%@", [a1 p_delUnnecessaryZero]);
    NSString *a2 = @"12.30";
    NSLog(@"%@", [a2 p_delUnnecessaryZero]);
    NSString *a3 = @"1209";
    NSLog(@"%@", [a3 p_delUnnecessaryZero]);
}


@end






