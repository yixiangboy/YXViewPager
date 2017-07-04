//
//  YXViewController.m
//  YXViewPager
//
//  Created by yixiangboy on 03/29/2017.
//  Copyright (c) 2017 yixiangboy. All rights reserved.
//

#import "YXViewController.h"
#import "YXViewPagerDemo1ViewController.h"
#import "YXViewPagerDemo2ViewController.h"
#import "YXViewPagerDemo3ViewController.h"
#import "YXViewPagerDemo4ViewController.h"
#import "YXViewPagerDemo5ViewController.h"
#import "YXViewPagerDemo6ViewController.h"
#import "YXViewPagerDemo7ViewController.h"
#import "YXViewPagerDemo8ViewController.h"

@interface YXViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;

@end

@implementation YXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ViewPager";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTableView];
}

-(void)initData{
    _items = @[@"图片+文字",@"只有文字",@"只有图片",@"图片+文字选中切换",@"超过一屏",@"rootVC与subVC通信",@"生命周期探索",@"周边好去处"];
}

-(void)initTableView{
    [self initData];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = _items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    UIViewController *vc;
    if (row==0) {
        vc = [[YXViewPagerDemo1ViewController alloc] init];
    }else if(row==1) {
        vc = [[YXViewPagerDemo2ViewController alloc] init];
    }else if(row==2) {
        vc = [[YXViewPagerDemo3ViewController alloc] init];
    }else if(row==3) {
        vc = [[YXViewPagerDemo4ViewController alloc] init];
    }else if(row==4){
        vc = [[YXViewPagerDemo5ViewController alloc] init];
    }else if(row==5){
        vc = [[YXViewPagerDemo6ViewController alloc] init];
    }else if(row==6){
        vc = [[YXViewPagerDemo7ViewController alloc] init];
    }else if(row==7){
        vc = [[YXViewPagerDemo8ViewController alloc] init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
