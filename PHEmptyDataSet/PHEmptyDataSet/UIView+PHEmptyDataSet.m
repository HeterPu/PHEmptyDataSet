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




-(ImageTitleButton *)viewForEmptyDataSet:(UIView *)view
                           emptyDataType:(PHEmptyNoDataType) type{
    
    
    MenuItem *item = [[MenuItem alloc] init];
    ImageTitleButton *titleBTN;
    if (type == PHEmptyNoDataNoNetwork) {
        item.title = K_PHempty_title;
        item.icon = K_PHempty_image;
        
        ImageTitleButton *btn = [[ImageTitleButton alloc]initWithMenu:item];
        btn.bounds = CGRectMake(0,0,K_PHempty_size.width,K_PHempty_size.height);
        btn.imageSize = K_PHempty_image_size;
        [btn setTitleColor:K_PHempty_title_color forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.padding = CGSizeMake(10, K_PHempty_padding);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.style = EImageTopTitleBottom;
        btn.adjustsImageWhenHighlighted = true;
        titleBTN = btn;
    }
    else
    {
        item.title = K_PHempty_title_noData;
        item.icon = K_PHempty_image_noData;
        
        ImageTitleButton *btn = [[ImageTitleButton alloc]initWithMenu:item];
        btn.bounds = CGRectMake(0,0,K_PHempty_size_noData.width,K_PHempty_size_noData.height);
        btn.imageSize = K_PHempty_image_size_noData;
        [btn setTitleColor:K_PHempty_title_color_noData forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.padding = CGSizeMake(10, K_PHempty_padding_noData);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.style = EImageTopTitleBottom;
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



-(void)noData{
    [self hasData];
    [self setEmptyDataWithType:PHEmptyNoData];
}

-(void)noNetWork {
    [self hasData];
    [self setEmptyDataWithType:PHEmptyNoDataNoNetwork];
}

-(void)hasData {
    UIView *view = [self viewWithTag:9527];
    if (!view) {view = [self viewWithTag:9528];}
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}


-(void)setEmptyDataWithType:(PHEmptyNoDataType)type {
    @WeakObj(self);
    CGRect rect = self.bounds;
    UIView * contentV = [UIView new];
    contentV.frame = CGRectMake(0, 0, rect.size.width,  rect.size.height);
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
    
    
    ImageTitleButton *imageTitleBTN;
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
    [imageTitleBTN setClickAction:^(id<MenuAbleItem> menu) {
        if ([selfWeak.phDataSetDelegate respondsToSelector:@selector(didTapEmptyDataView:emptyDataType:)]) {
            if ([selfWeak.phDataSetDelegate didTapEmptyDataView:selfWeak emptyDataType:type]) {
                [contentV removeFromSuperview];
            }
        }
    }];
    
    contentV.alpha = 0.1;
    [UIView animateWithDuration:0.5 animations:^{
        contentV.alpha = 1;
    }];

}

@end
