//
//  ViewController.m
//  cell选择
//
//  Created by zj on 2016/11/9.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tv;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * bu = [UIButton buttonWithType:UIButtonTypeCustom];
    bu.frame = CGRectMake(50, 10, 100, 30);
    bu.backgroundColor = [UIColor redColor];
    [self.view addSubview:bu];
    [bu addTarget:self action:@selector(editTv) forControlEvents:UIControlEventTouchUpInside];
    
    
    _tv = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tv.delegate = self;
    _tv.dataSource = self;
    [_tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tv.allowsMultipleSelectionDuringEditing =YES;
    [self.view addSubview:_tv];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"列表%ld",indexPath.row+1];
    return cell;
}

-(void)editTv
{
    _tv.allowsMultipleSelectionDuringEditing =YES;
}

@end
