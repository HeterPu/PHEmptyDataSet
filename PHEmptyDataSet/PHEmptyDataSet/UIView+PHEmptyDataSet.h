//
//  UIView+PHEmptyDataSet.h
//  dddd
//
//  Created by Peter Hu on 2017/3/21.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PHEmptySet_Constant.h"
#import "ImageTitleButton.h"


/**
 显示类型

 - PHEmptyNoDataNoNetwork: 没有网络的时候
 - PHEmptyNoDataNoData: 没有数据的时候
 */
typedef NS_ENUM(NSInteger, PHEmptyNoDataType){
    PHEmptyNoDataNoNetwork = 0,
    PHEmptyNoData,
};


@protocol PHEmptyDataSetDelegate <NSObject>

@required

/**
 点击无数据&无网络图片时触发的事件

 @param view 传入的view
 @param type 传入类型
 @return 返回值决定视图是否消失，true 消失， false 不消失。
 */
-(BOOL)didTapEmptyDataView:(UIView *)view
             emptyDataType:(PHEmptyNoDataType) type;

@optional

/**
 获取自定义点击视图

 @param view 传入的view
 @param type 传入类型
 @return 返回视图
 */
-(ImageTitleButton *)viewForEmptyDataSet:(UIView *)view
                           emptyDataType:(PHEmptyNoDataType) type;


/**
 获取背景图颜色

 @param view 传入的view
 @param type 传入类型
 @return 返回背景图片颜色
 */
-(UIColor *)backgroundColorForEmptyDataSet:(UIView *)view
                             emptyDataType:(PHEmptyNoDataType) type;


/**
 获取垂直偏移

 @param view 传入的view
 @param type type 传入类型
 @return 返回垂直偏移量
 */
-(CGFloat)verticalOffsetForEmptyDataSet:(UIView *)view
                          emptyDataType:(PHEmptyNoDataType) type;



/**
 获取水平偏移

 @param view view 传入的view
 @param type type type 传入类型
 @return 返回水平偏移量
 */
-(CGFloat)horizenOffsetForEmptyDataSet:(UIView *)view
                         emptyDataType:(PHEmptyNoDataType) type;
@end



/**
   UIView 为 UITableView， UICollectionView，UIWebView的父类，可用于设置这三种属性。
 */
@interface UIView (PHEmptyDataSet)


/**
   代理方法，用于获取视图及响应点击
 */
@property (nonatomic, assign) id<PHEmptyDataSetDelegate> phDataSetDelegate;


/**
  无数据时调用
 */
-(void)noData;


/**
 无网络时调用
 */
-(void)noNetWork;



/**
 有数据时调用
 */
-(void)hasData;

/**
 无数据时是否开启动画

 @param isAnimated 是否
 */
-(void)noDataWithAnimated:(BOOL)isAnimated;


/**
 无网络时否开启动画
 
 @param isAnimated 是否
 */
-(void)noNetWorkWithAnimated:(BOOL)isAnimated;


/**
 有数据时是否开启动画
 
 @param isAnimated 是否
 */
-(void)hasDataWithAnimated:(BOOL)isAnimated;


@end
