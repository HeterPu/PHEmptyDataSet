//
//  PHEmptySet_Constant.h
//  dddd
//
//  Created by Peter Hu on 2017/3/21.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//  Like it,Star it on : https://github.com/HeterPu/PHEmptyDataSet
//

#ifndef PHEmptySet_Constant_h
#define PHEmptySet_Constant_h


#define k_PHRGB(R, G, B, A)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


////////////////////////////自定义属性区域///////////////////
/**
  设置无网络时的默认属性
 */
//设置默认显示区域尺寸
#define K_PHempty_size  CGSizeMake(100, 150)

//设置默认显示区域的垂直偏移，默认为0，垂直居中显示
#define K_PHempty_offset  0.01
//设置默认显示区域的水平偏移，默认为0，水平居中显示
#define K_PHempty_offset_h  0.01

//设置默认显示区域的图片
#define K_PHempty_image  [UIImage imageNamed:@"network_bad"]
//设置默认显示区域的图片大小
#define K_PHempty_image_size CGSizeMake(80, 80)

//设置默认显示区域的提示文字
#define K_PHempty_title   @"没有网络"
//设置默认显示区域的提示文字的颜色
#define K_PHempty_title_color   k_PHRGB(157, 157, 157, 1.0)
//设置默认显示区域的提示文字的高亮颜色
#define K_PHempty_title_color_highlighted  k_PHRGB(100, 100, 100, 1.0)

//设置文字与图片的间隔
#define K_PHempty_padding   1.0

//设置背景颜色
#define K_PHempty_backGroundColor   k_PHRGB(240, 240, 240, 1)



/**
 设置无数据时的默认属性
 */
//设置默认显示区域尺寸
#define K_PHempty_size_noData  CGSizeMake(100, 150)

//设置默认显示区域的垂直偏移，默认为0，垂直居中显示
#define K_PHempty_offset_noData  0.01
//设置默认显示区域的水平偏移，默认为0，水平居中显示
#define K_PHempty_offset_h_noData  0.01

//设置默认显示区域的图片
#define K_PHempty_image_noData  [UIImage imageNamed:@"nodata"]
//设置默认显示区域的图片大小
#define K_PHempty_image_size_noData CGSizeMake(80, 80)

//设置默认显示区域的提示文字
#define K_PHempty_title_noData   @"没有数据"
//设置默认显示区域的提示文字的颜色
#define K_PHempty_title_color_noData  k_PHRGB(157, 157, 157, 1.0)
//设置默认显示区域的提示文字的高亮颜色
#define K_PHempty_title_color_noData_highlighted  k_PHRGB(100, 100, 100, 1.0)

//设置文字与图片的间隔
#define K_PHempty_padding_noData   1.0

//设置背景颜色
#define K_PHempty_backGroundColor_noData   k_PHRGB(240, 240, 240, 1)

////////////////////////////自定义属性区域///////////////////

#endif /* PHEmptySet_Constant_h */
