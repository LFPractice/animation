//
//  LFBottomTab.m
//  LFAnimation
//
//  Created by 王林芳 on 2019/12/16.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFBottomTab.h"
@interface LFBottomTab()

@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation LFBottomTab

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)setBottomTabStatus:(BottomTabStatus)bottomTabStatus {
    
    if (_bottomTabStatus == bottomTabStatus) {
        return;
    }
    
    _bottomTabStatus = bottomTabStatus;
    
    
    CATransition *transiton = [CATransition animation];
    transiton.type = @"push";
    transiton.subtype = @"fromTop";
    transiton.duration = 0.2;
    
    switch (bottomTabStatus) {
        case BottomTabStatusNormal:
        {
            self.imageView.image = [UIImage imageNamed:@"img_normal"];
            break;
        }
        case BottomTabStatusShowTop:
        {
            self.imageView.image = [UIImage imageNamed:@"img_selected1"];
            [self.imageView.layer addAnimation:transiton forKey:nil];
            break;
        }
        case BottomTabStatusSelected:
        {
            transiton.subtype = @"fromBottom";
            self.imageView.image = [UIImage imageNamed:@"img_selected2"];
            [self.imageView.layer addAnimation:transiton forKey:nil];
            break;
        }
           
        default:
            break;
    }
}

- (void)createUI {
    [self addSubview:self.imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    
    [self addGestureRecognizer:tap];
}

- (void)tapClick {
    if (self.bottomTabStatus == BottomTabStatusShowTop) {
        if (self.scrollToTop) {
//            self.bottomTabStatus = BottomTabStatusSelected;
            self.scrollToTop();
        }
    }
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, 100, 100);
        _imageView.image = [UIImage imageNamed:@"img_normal"];
    }
    return _imageView;
}
@end
