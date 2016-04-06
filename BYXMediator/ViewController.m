//
//  ViewController.m
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "ViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import "BYXMediator+BYXMediatorModuleAActions.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation ViewController


#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    [self.tableView fill];
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

#pragma mark --tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text=[self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"7777777");
    if (indexPath.row==0) {
        UIViewController *viewController=[[BYXMediator sharedInstance] BYXMediator_viewControllerForDetail];
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row==1) {
        UIViewController *viewController=[[BYXMediator sharedInstance] BYXMediator_viewControllerForDetail];
        
        
        [self.navigationController presentViewController:viewController animated:YES completion:nil];
    }
    if (indexPath.row==2) {
        UIImage *iamge=[UIImage imageNamed:@"image"];
        UIViewController *viewController=[[BYXMediator sharedInstance] BYXMediator_presentImage:iamge];
        [self.navigationController presentViewController:viewController animated:YES completion:nil];
    }
    
    if (indexPath.row==3) {
        UIImage *iamge=[UIImage imageNamed:@"image111"];
        UIViewController *viewController=[[BYXMediator sharedInstance] BYXMediator_presentImage:iamge];
        [self.navigationController presentViewController:viewController animated:YES completion:nil];
    }
    
    if (indexPath.row==4) {
         UIAlertController *viewController=[[BYXMediator sharedInstance] BYXMediator_showAlertWithMessage:@"弹框的内容" cancelAction:^(NSDictionary *dic) {
             NSLog(@"%@", dic);
         } confirmAction:^(NSDictionary *dic) {
             NSLog(@"2222222222222222");
         }];
        [self.navigationController presentViewController:viewController animated:YES completion:nil];
    }
}


#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters and setters

-(NSString *)title
{
    return @"view组件演示";
}

-(UITableView *)tableView
{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}

-(NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"present detail view controller", @"push detail view controller", @"present image", @"present image when error", @"show alert"];
    }
    return _dataSource;
}

@end
