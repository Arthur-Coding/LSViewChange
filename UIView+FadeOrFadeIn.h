//
//  UIView+FadeOrFadeIn.h
//
//  Created by ArthurShuai on 16/4/24.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//
//  View as the ScrollView rolling, realize to hide or show gradually, when implementing this method, it is suggested that the ScrollView (scrollViewDidScroll:) agent method to complete implementation
//  视图随着ScrollView的滚动,实现逐渐隐藏或者显示,实现此方法时,建议在ScrollView (scrollViewDidScroll:)代理方法中完成实现

#import <UIKit/UIKit.h>

//Select view change type, it is gradually to hide or show itself(选择视图的改变类型,是逐渐隐藏还是逐渐显现)
typedef NS_ENUM(NSInteger, UIChangeStyle) {
    UIChangeStyleFade,//View gradually hidden(视图逐渐隐藏)
    UIChangeStyleFadeIn,//View gradually revealed(视图逐渐显示)
};
@interface UIView (FadeOrFadeIn)
- (void)viewWillChangeInStyle:(UIChangeStyle)changeStyle AsScrollView:(UIScrollView *)scrollView UntiltheDistance:(CGFloat)distance;//'changeStyle':Select view change type, it is gradually to hide or show itself(选择视图的改变类型,是逐渐隐藏还是逐渐显现);'disrance':Determine a distance, at that distance point location, the view will be completely hide or show completely(确定一个距离,在这个距离位置点,视图将会完全隐藏或者完全显示)
@end
