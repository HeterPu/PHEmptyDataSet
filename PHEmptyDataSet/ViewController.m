//
//  ViewController.m
//  PHEmptyDataSet
//
//  Created by Peter Hu on 2017/3/22.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#import "ViewController.h"

#import "PHEmptyDataSet.h"



/**
   //步骤:
          1.导入 PHEmptyDataSet.h
          2.添加代理协议PHEmptyDataSetDelegate,可以不设置代理，则属性使用默认属性
          3.添加视图的代理 eg: self.view.phDataSetDelegate = self;
          4.完删代理的方法
          5.使用[view hasData],[view nodata],[view noNetWork] 来处理数据情况
 
   // Steps:
          1.Import PHEmptyDataSet.h
          2. Add delegate Protocal PHEmptyDataSetDelegate, No Setting use default properties.
          3.Add view delegate. eg: self.view.phDataSetDelegate = self;
          4.Complte delegate methods.
          5.Use[view hasData],[view nodata],[view noNetWork] to access different situation.
 */



@interface ViewController ()<PHEmptyDataSetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.phDataSetDelegate = self;
    
    [self.view noData];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma mark -- PHempty delegate

-(BOOL)didTapEmptyDataView:(UIView *)view emptyDataType:(PHEmptyNoDataType)type {
    
    return true;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
