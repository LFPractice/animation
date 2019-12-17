//
//  LFBottomTab.h
//  LFAnimation
//
//  Created by 王林芳 on 2019/12/16.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, BottomTabStatus) {
    BottomTabStatusNormal = 0,
    BottomTabStatusShowTop = 1,
    BottomTabStatusSelected = 2,
};
@interface LFBottomTab : UIView
@property (nonatomic, copy) void(^scrollToTop)(void);
@property (nonatomic, assign) BottomTabStatus bottomTabStatus;
@end

NS_ASSUME_NONNULL_END
