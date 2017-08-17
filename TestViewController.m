//
//  TestViewController.m
//  ClientOSBuyShopping
//
//  Created by maying on 2017/8/17.
//  Copyright © 2017年 Gome. All rights reserved.
//

#import "TestViewController.h"

#import <Masonry/Masonry.h>


@interface TestCell : UITableViewCell
@end

@implementation TestCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIButton * aButton = [[UIButton alloc] init];
        [self.contentView addSubview:aButton];
        [aButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [aButton setTitle:@"按钮" forState:UIControlStateNormal];
        [aButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.centerY.mas_equalTo(self.contentView);
            make.width.height.mas_equalTo(80);
        }];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [aButton addTarget:self action:@selector(aButtonClickded) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView * line = [UIView new];
        [self.contentView addSubview:line];
        line.backgroundColor = [UIColor whiteColor];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self.contentView);
            make.height.mas_equalTo(0.5);
        }];
        
        self.contentView.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)aButtonClickded
{
    NSLog(@"cell -- button - clickded");
}

@end

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
{
    UIView * _aView;
    UITableView * _tableView;
}
@end

@implementation TestViewController

-(BOOL)automaticallyAdjustsScrollViewInsets
{
    return FALSE;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_tableView registerClass:TestCell.class forCellReuseIdentifier:@"TestCell"];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
    
    //
    
    _aView = [UIView new];
    _aView.userInteractionEnabled = FALSE;
    _aView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(200);
        make.top.mas_equalTo(self.view).offset(300);
        make.width.height.mas_equalTo(100);
    }];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
}

-(void)tap:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tap");
}

#pragma TableViewDataSource,TableViewDelgate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * res = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    res.textLabel.font = [UIFont systemFontOfSize:25];
    res.textLabel.textAlignment = NSTextAlignmentCenter;
    res.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return res;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
}



#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint location =  [gestureRecognizer locationInView:self.view];
    CGRect aViewFrame = _aView.frame;
    return CGRectContainsPoint(aViewFrame, location);
}


@end
