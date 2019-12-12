//
//  LFAimatoinOneController.m
//  LFAnimation
//
//  Created by 王林芳 on 2019/12/12.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFAimatoinOneController.h"

@interface LFAimatoinOneController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@end

@implementation LFAimatoinOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
}

- (void)createUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    
    self.button3.frame = CGRectMake(10, 220, 100, 30);
    self.button1.frame = CGRectMake(10 + 10 + 100, 220, 100, 30);
    self.button2.frame = CGRectMake(10 + 10 + 100 + 100, 220, 100, 30);
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(100, 100, 100, 100);
        _imageView.image = [UIImage imageNamed:@"img_normal"];
    }
    return _imageView;
}

- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button1 setTitle:@"状态一" forState:UIControlStateNormal];
        _button1.tag = 100;
        [_button1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button1 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    }
    return _button1;
}

- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button2 setTitle:@"状态二" forState:UIControlStateNormal];
        [_button2 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        _button2.tag = 101;
        [_button2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button2;
}

- (UIButton *)button3 {
    if (!_button3) {
        _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button3 setTitle:@"默认状态" forState:UIControlStateNormal];
        _button3.tag = 102;
        [_button3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button3 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        _button3.selected = YES;
    }
    return _button3;
}

- (void)btnClick:(UIButton *)sender {
    if (sender.selected) {
        return;
    }
    NSArray *buttonArray = @[self.button1,self.button2,self.button3];
    for (UIButton *btn in buttonArray) {
        btn.selected = NO;
    }
    sender.selected = YES;
    
    CATransition *transiton = [CATransition animation];
    transiton.type = @"push";
    transiton.subtype = @"fromTop";
    transiton.duration = 0.1;
    switch (sender.tag) {
        case 100:
        {
            
            self.imageView.image = [UIImage imageNamed:@"img_selected1"];
            [self.imageView.layer addAnimation:transiton forKey:nil];
            break;
        }
            
        case 101:
        {
            self.imageView.image = [UIImage imageNamed:@"img_selected2"];
            [self.imageView.layer addAnimation:transiton forKey:nil];
            break;
        }
        case 102:
        {
            self.imageView.image = [UIImage imageNamed:@"img_normal"];
            break;
        }
            
        default:
            break;
    }
}
@end
