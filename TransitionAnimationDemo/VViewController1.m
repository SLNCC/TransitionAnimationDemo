//
//  VViewController1.m
//  TransitionAnimationDemo
//
//  Created by 乔冬 on 17/5/5.
//  Copyright © 2017年 XinHuaTV. All rights reserved.
//

#import "VViewController1.h"

@interface VViewController1 ()


@property (nonatomic , strong) UIView *demoView;

@property (nonatomic , strong) UILabel *demoLabel;

@property (nonatomic , assign) NSInteger index;

@end

@implementation VViewController1
-(void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
}
-(void)initView{
    _index = 0;
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(20, 100,self.view.frame.size.width-40,self.view.frame.size.height - 49 -64)];
    [self.view addSubview:_demoView];
    
    _demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_demoView.frame)/2-10, CGRectGetHeight(_demoView.frame)/2-20, 20, 40)];
    _demoLabel.textAlignment = NSTextAlignmentCenter;
    _demoLabel.font = [UIFont systemFontOfSize:40];
    [_demoView addSubview:_demoLabel];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_demoView addGestureRecognizer:swipe];
    [self changeView:YES];
}


/**
 *   设置view的值
 */
-(void)changeView : (BOOL)isUp{
    if (_index>2) {
        _index = 0;
    }
    if (_index<0) {
        _index = 2;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    _demoView.backgroundColor = [colors objectAtIndex:_index];
    _demoLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    [self moveInAnimation];
    if(recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right");
    }
}

-(void)moveInAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 0.5;
    
    [_demoView.layer addAnimation:anima forKey:@"moveInAnimation"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
