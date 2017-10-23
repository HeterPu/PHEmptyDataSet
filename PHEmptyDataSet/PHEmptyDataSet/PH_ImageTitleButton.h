//
//  ImageTitleButton.h
//  CommonLibrary
//
//  Created by Alexi on 3/21/14.
//  Copyright (c) 2014 Alexi. All rights reserved.
// Thanks to Alex

#import <UIKit/UIKit.h>


/**
 图片标题按钮协议
 */
@protocol PH_MenuAbleItem;

typedef void (^PH_MenuAction)(id<PH_MenuAbleItem> menu);
typedef void (^PH_MenuHighlightedAction)(id<PH_MenuAbleItem> menu,BOOL isHighted);

@protocol PH_MenuAbleItem <NSObject>


- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon action:(PH_MenuAction)action;

@optional
- (NSString *)title;
- (UIImage *)icon;
- (void)menuAction;
- (NSInteger)tag;
- (void)setTag:(NSInteger)tag;

@optional
- (UIColor *)foreColor;

@end



/**
 按钮的数据模型
 */
@interface PH_MenuItem : NSObject<PH_MenuAbleItem>
{
@protected
    NSString    *_title;
    UIImage     *_icon;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, copy) PH_MenuAction action;

@end



/**
 带有block的普通菜单按钮
 */
@interface PH_MenuButton : UIButton<PH_MenuAbleItem>

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithTitle:(NSString *)title action:(PH_MenuAction)action;

- (instancetype)initWithBackground:(UIImage *)icon action:(PH_MenuAction)action;

- (instancetype)initWithMenu:(PH_MenuItem *)item;

- (void)setClickAction:(PH_MenuAction)action;

- (void)setHighlightedPressAction:(PH_MenuHighlightedAction)action;

// protected
- (void)onClick:(id)sender;

@end




typedef enum
{
    PH_EImageTopTitleBottom,
    PH_ETitleTopImageBottom,
    PH_EImageLeftTitleRight,
    PH_ETitleLeftImageRight,
    
    PH_EImageLeftTitleRightLeft,
    PH_EImageLeftTitleRightCenter,
    
    PH_ETitleLeftImageRightCenter,
    PH_ETitleLeftImageRightLeft,
    
    PH_EFitTitleLeftImageRight, // 根据内容调整

    
}PH_ImageTitleButtonStyle;




/**
 图片文字菜单
 */
@interface PH_ImageTitleButton : PH_MenuButton
{
@protected
    UIEdgeInsets _margin;
    CGSize _padding;
    CGSize _imageSize;
    PH_ImageTitleButtonStyle _style;
}

@property (nonatomic, assign) UIEdgeInsets margin;
@property (nonatomic, assign) CGSize padding;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) PH_ImageTitleButtonStyle style;

- (instancetype)initWithStyle:(PH_ImageTitleButtonStyle)style;

- (instancetype)initWithStyle:(PH_ImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin;

- (instancetype)initWithStyle:(PH_ImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin padding:(CGSize)padding;

- (void)setMyTintColor:(UIColor *)color;

-(void)setDisableHighted:(BOOL)isDisabled;

@end


@interface UIImage (ImageBtnTintColor)

// tint只对里面的图案作更改颜色操作
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

@end


@interface UILabel (PH_ImageTitleCommon)


+ (instancetype)label;

+ (instancetype)labelWithTitle:(NSString *)title;

// 已知区域重新调整
- (CGSize)contentSize;

// 不知区域，通过其设置区域
- (CGSize)textSizeIn:(CGSize)size;

//- (void)layoutInContent;

@end


@interface PH_InsetLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets contentInset;

@end
