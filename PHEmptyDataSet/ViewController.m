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

@property(nonatomic,assign) BOOL isNoData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.phDataSetDelegate = self;
    
    [self.view noNetWork];
    // [self.view noData]
    
    
}





#pragma mark -- PHempty delegate

-(UIColor *)backgroundColorForEmptyDataSet:(UIView *)view emptyDataType:(PHEmptyNoDataType)type {
    if (type == PHEmptyNoDataNoNetwork) {
        return [UIColor redColor];
    }
    return [UIColor cyanColor];
}


-(BOOL)didTapEmptyDataView:(UIView *)view emptyDataType:(PHEmptyNoDataType)type {
    _isNoData = !_isNoData;
    [self toggleView];
    return true;
}



-(void)toggleView{
    if (_isNoData) {
        [self.view noData];
    }
    else
    {
       [self.view noNetWork];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
