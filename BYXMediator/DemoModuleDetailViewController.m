//
//  DemoModuleDetailViewController.m
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "DemoModuleDetailViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>
@interface DemoModuleDetailViewController ()


@property (nonatomic,strong) UIButton *returnBtn;

@end

@implementation DemoModuleDetailViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.valueLabel];
    
    NSLog(@"y:%f",self.valueLabel.bottom);
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.returnBtn];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomDelegate

#pragma mark - event response

-(void)action_back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private methods

#pragma mark - getters and setters

-(UILabel *)valueLabel
{
    if (_valueLabel==nil) {
        _valueLabel=[[UILabel alloc] init];
        _valueLabel.size=CGSizeMake(SCREEN_WIDTH, 44);
        _valueLabel.backgroundColor=[UIColor whiteColor];
        _valueLabel.textAlignment=NSTextAlignmentCenter;
        _valueLabel.center=self.view.center;
    }
    return _valueLabel;
}

-(UIImageView *)imageView
{
    if (_imageView==nil) {
        _imageView=[[UIImageView alloc] init];
        _imageView.size=CGSizeMake(40, 40);
        _imageView.centerX=self.view.centerX;
        _imageView.y=self.valueLabel.bottom + self.view.centerY;
    }
    return _imageView;
}


-(UIButton *)returnBtn
{
    if (_returnBtn==nil) {
        _returnBtn=[[UIButton alloc]  init];
        _returnBtn.size=CGSizeMake(SCREEN_WIDTH, 44);
        _returnBtn.x=0;
        _returnBtn.backgroundColor=[UIColor redColor];
        [_returnBtn setTitle:@"return" forState:UIControlStateNormal];
        [_returnBtn addTarget:self action:@selector(action_back) forControlEvents:UIControlEventTouchUpInside];
        _returnBtn.y=self.imageView.bottom ;
    }
    return _returnBtn;
}


@end
