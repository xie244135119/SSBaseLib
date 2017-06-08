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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
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
    SSJSONValueTransformer *transformer = [[SSJSONValueTransformer alloc]init];
    NSLog(@"  %@ ",transformer);
    SSJSONModel *model = [[SSJSONModel alloc]init];
    AMDBaseViewModel *viewmodel = [[AMDBaseViewModel alloc]init];
}




@end
