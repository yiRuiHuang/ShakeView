//
//  ViewController.m
//  viewShake
//
//  Created by hyrMac on 15/8/7.
//  Copyright (c) 2015年 hyrMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"2.png"];
    imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UILongPressGestureRecognizer *pressLong = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressAction:)];
    pressLong.minimumPressDuration = 1;
    [imageView addGestureRecognizer:pressLong];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    CGPoint view1Point = [self.view convertPoint:p toView:imageView];

    if (![imageView pointInside:view1Point withEvent:event]) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"rotate"];
        if (animation != nil) {

            imageView.layer.speed = 0;
        }
    }


}

- (void)pressAction:(UILongPressGestureRecognizer *)pressLong {
    
    NSLog(@"pressAction:");
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 0.1;
    animation.repeatCount = HUGE_VAL;
    imageView.layer.speed = 1;
    animation.values = @[@0,@(-(M_PI)/30),@0,@((M_PI)/30)];
    
    [imageView.layer addAnimation:animation forKey:@"rotate"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
