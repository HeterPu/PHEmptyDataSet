//
//  UIScrollView+PHEmptyDataSet.m
//  dddd
//
//  Created by Peter Hu on 2017/3/21.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//


#import <objc/runtime.h>
#import "UIView+PHEmptyDataSet.h"

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;  //宏定义self


const void *DelegateStringKey = "phDataSetDelegateKey";


@implementation UIView (PHEmptyDataSet)


-(void)setPhDataSetDelegate:(id<PHEmptyDataSetDelegate>)phDataSetDelegate {
    objc_setAssociatedObject(self,DelegateStringKey, phDataSetDelegate, OBJC_ASSOCIATION_ASSIGN);
}

-(id<PHEmptyDataSetDelegate>)phDataSetDelegate{
     return objc_getAssociatedObject(self, DelegateStringKey);
}




-(PH_ImageTitleButton *)viewForEmptyDataSet:(UIView *)view
                           emptyDataType:(PHEmptyNoDataType) type{
    
    
    PH_MenuItem *item = [[PH_MenuItem alloc] init];
    PH_ImageTitleButton *titleBTN;
    if (type == PHEmptyNoDataNoNetwork) {
        item.title = K_PHempty_title;
        item.icon = K_PHempty_image;
        
        PH_ImageTitleButton *btn = [[PH_ImageTitleButton alloc]initWithMenu:item];
        btn.bounds = CGRectMake(0,0,K_PHempty_size.width,K_PHempty_size.height);
        btn.imageSize = K_PHempty_image_size;
        [btn setTitleColor:K_PHempty_title_color forState:UIControlStateNormal];
        [btn setTitleColor:K_PHempty_title_color_highlighted forState:UIControlStateHighlighted];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.padding = CGSizeMake(10, K_PHempty_padding);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.style = PH_EImageTopTitleBottom;
        btn.adjustsImageWhenHighlighted = true;
        titleBTN = btn;
    }
    else
    {
        item.title = K_PHempty_title_noData;
        item.icon = K_PHempty_image_noData;
        
        PH_ImageTitleButton *btn = [[PH_ImageTitleButton alloc]initWithMenu:item];
        btn.bounds = CGRectMake(0,0,K_PHempty_size_noData.width,K_PHempty_size_noData.height);
        btn.imageSize = K_PHempty_image_size_noData;
        [btn setTitleColor:K_PHempty_title_color_noData forState:UIControlStateNormal];
        [btn setTitleColor:K_PHempty_title_color_noData_highlighted forState:UIControlStateHighlighted];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.padding = CGSizeMake(10, K_PHempty_padding_noData);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.style = PH_EImageTopTitleBottom;
        btn.adjustsImageWhenHighlighted = true;
        titleBTN = btn;
    }
    
       return titleBTN;
}
-(UIColor *)backgroundColorForEmptyDataSet:(UIView *)view
                             emptyDataType:(PHEmptyNoDataType) type{
    if (type == PHEmptyNoDataNoNetwork) {
        return K_PHempty_backGroundColor;
    }
   return K_PHempty_backGroundColor_noData;
}

-(CGFloat)verticalOffsetForEmptyDataSet:(UIView *)view
                          emptyDataType:(PHEmptyNoDataType) type{
    if (type == PHEmptyNoDataNoNetwork) {
        return K_PHempty_offset;
    }
    return K_PHempty_offset_noData;
}



-(CGFloat)horizenOffsetForEmptyDataSet:(UIView *)view
                         emptyDataType:(PHEmptyNoDataType) type{
    if (type == PHEmptyNoDataNoNetwork) {
        return K_PHempty_offset_h;
    }
    return K_PHempty_offset_h_noData;
}


-(UIEdgeInsets)viewForEdgeInSet:(UIView *)view
                  emptyDataType:(PHEmptyNoDataType) type{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


-(void)noData{
    [self hasData];
    [self setEmptyDataWithType:PHEmptyNoData andAnimationType:true];
}

-(void)noNetWork {
    [self hasData];
    [self setEmptyDataWithType:PHEmptyNoDataNoNetwork andAnimationType:true];
}




-(void)noDataWithAnimated:(BOOL)isAnimated{
    [self hasDataWithAnimated:false];
    [self setEmptyDataWithType:PHEmptyNoData andAnimationType:isAnimated];
}

-(void)noNetWorkWithAnimated:(BOOL)isAnimated {
    [self hasDataWithAnimated:false];
    [self setEmptyDataWithType:PHEmptyNoDataNoNetwork andAnimationType:isAnimated];
}



-(void)hasData {
    [self hasDataWithAnimated:true];
}

-(void)hasDataWithAnimated:(BOOL)isAnimated{
    UIView *view = [self viewWithTag:9527];
    if (!view) {view = [self viewWithTag:9528];}
    if (!isAnimated) {
        view.alpha = 0;
        [view removeFromSuperview];
    }
    {
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
    }
}


-(void)setEmptyDataWithType:(PHEmptyNoDataType)type andAnimationType:(BOOL)animated {
    @WeakObj(self);
    CGRect rect = self.bounds;
    UIView * contentV = [UIView new];
    contentV.tag = (type == PHEmptyNoDataNoNetwork)? 9527:9528;
    
    UIColor *color;
    if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(backgroundColorForEmptyDataSet: emptyDataType:)]) {
        color = [selfWeak.phDataSetDelegate backgroundColorForEmptyDataSet:selfWeak emptyDataType:type];
        if (!color) {color = [self backgroundColorForEmptyDataSet:self emptyDataType:type];}
    }
    else
    {
        color = [self backgroundColorForEmptyDataSet:self emptyDataType:type];
    }
    contentV.backgroundColor = color;
    
    
    UIEdgeInsets inset;
    
    if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(viewForEdgeInSet:emptyDataType:)]) {
        inset = [selfWeak.phDataSetDelegate viewForEdgeInSet:selfWeak emptyDataType:type];
    }
    else
    {
        inset = [self viewForEdgeInSet:self emptyDataType:type];
    }
    
    contentV.frame = CGRectMake(inset.left, inset.top, rect.size.width - inset.left - inset.right,  rect.size.height-inset.top - inset.bottom);
    
    PH_ImageTitleButton *imageTitleBTN;
    if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(viewForEmptyDataSet:emptyDataType:)]) {
        imageTitleBTN = [selfWeak.phDataSetDelegate viewForEmptyDataSet:selfWeak emptyDataType:type];
        if (!imageTitleBTN) {imageTitleBTN = [self viewForEmptyDataSet:self emptyDataType:type];}
    }
    else
    {
        imageTitleBTN = [self viewForEmptyDataSet:self emptyDataType:type];
    }
    [contentV addSubview:imageTitleBTN];
    [self addSubview:contentV];
    
    CGFloat offset;
    if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(verticalOffsetForEmptyDataSet:emptyDataType:)]) {
        offset = [selfWeak.phDataSetDelegate verticalOffsetForEmptyDataSet:selfWeak emptyDataType:type];
        if (!offset) { offset = [self verticalOffsetForEmptyDataSet:self emptyDataType:type];}
    }
    else
    {
        offset = [self verticalOffsetForEmptyDataSet:self emptyDataType:type];
    }
    
    
    
    CGFloat offset_h;
    if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(horizenOffsetForEmptyDataSet:emptyDataType:)]) {
        offset_h = [selfWeak.phDataSetDelegate horizenOffsetForEmptyDataSet:selfWeak emptyDataType:type];
        if (!offset_h) { offset = [self horizenOffsetForEmptyDataSet:self emptyDataType:type];}
    }
    else
    {
        offset_h = [self horizenOffsetForEmptyDataSet:self emptyDataType:type];
    }

    
    imageTitleBTN.center = CGPointMake(rect.size.width / 2 + offset_h, rect.size.height / 2 + offset);
    [imageTitleBTN setClickAction:^(id<PH_MenuAbleItem> menu) {
        if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(didTapEmptyDataView:emptyDataType:)]) {
            if ([selfWeak.phDataSetDelegate didTapEmptyDataView:selfWeak emptyDataType:type]) {
                [contentV removeFromSuperview];
            }
        }
    }];
    
    
    if (animated) {
        contentV.alpha = 0.1;
        [UIView animateWithDuration:0.5 animations:^{
            contentV.alpha = 1;
        }];
    }
    else
    {
        contentV.alpha = 1;

    }
}

@end
