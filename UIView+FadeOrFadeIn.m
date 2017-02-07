//
//  UIView+FadeOrFadeIn.m
//
//  Created by ArthurShuai on 16/4/24.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//
//  View as the ScrollView rolling, realize to hide or show gradually, when implementing this method, it is suggested that the ScrollView (scrollViewDidScroll:) agent method to complete implementation

//  视图随着ScrollView的滚动,实现逐渐隐藏或者显示,实现此方法时,建议在ScrollView (scrollViewDidScroll:)代理方法中完成实现

#import "UIView+FadeOrFadeIn.h"

@implementation UIView (FadeOrFadeIn)
- (void)viewWillChangeInStyle:(UIChangeStyle)changeStyle AsScrollView:(UIScrollView *)scrollView UntiltheDistance:(CGFloat)distance{
    self.hidden = NO;//Prevent view initially hidden attribute mistakenly choose to YES(防止视图刚开始的隐藏属性误选为 YES)
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (changeStyle == UIChangeStyleFade) {
        if (offsetX == 0) self.alpha = (distance-offsetY)/distance;
        else if (offsetY == 0) self.alpha = (distance-offsetX)/distance;
    }else if (changeStyle == UIChangeStyleFadeIn){
        if (offsetX == 0) self.alpha = offsetY/distance;
        else if (offsetY == 0) self.alpha = offsetX/distance;
    }
    for (UIView *subView in self.subviews) {
        subView.alpha = self.alpha;
        if (subView.subviews.count>0) [subView viewWillChangeInStyle:changeStyle AsScrollView:scrollView UntiltheDistance:distance];
    }
}
@end
