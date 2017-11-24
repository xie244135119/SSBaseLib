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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
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




@end
