//
//  PHEmptySet_Constant.h
//  dddd
//
//  Created by Peter Hu on 2017/3/21.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#ifndef PHEmptySet_Constant_h
#define PHEmptySet_Constant_h



/**
  设置无网络时的默认属性
 */
#define K_PHempty_size  CGSizeMake(100, 150)
#define K_PHempty_offset  0.01
#define K_PHempty_offset_h  0.01
#define K_PHempty_title_color   [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0]
#define K_PHempty_image  [UIImage imageNamed:@"network_bad"]
#define K_PHempty_image_size CGSizeMake(80, 80)
#define K_PHempty_title   @"没有网络"
#define K_PHempty_title_color_highlighted  [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define K_PHempty_padding   1.0
#define K_PHempty_backGroundColor   [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]



/**
 设置无数据时的默认属性
 */
#define K_PHempty_size_noData  CGSizeMake(100, 150)
#define K_PHempty_offset_noData  0.01
#define K_PHempty_offset_h_noData  0.01
#define K_PHempty_title_color_noData   [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0]
#define K_PHempty_image_noData  [UIImage imageNamed:@"network_bad"]
#define K_PHempty_image_size_noData CGSizeMake(80, 80)
#define K_PHempty_title_noData   @"没有数据"
#define K_PHempty_padding_noData   1.0
#define K_PHempty_title_color_noData_highlighted  [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define K_PHempty_backGroundColor_noData   [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]



#endif /* PHEmptySet_Constant_h */
