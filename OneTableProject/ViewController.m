//
//  ViewController.m
//  OneTableProject
//
//  Created by user on 2019/7/25.
//  Copyright © 2019 rxgzs. All rights reserved.
//

#import "ViewController.h"

#define kTitle @"title"// 头部标题对应的key
#define xList @"list"
#define kFooter @"footer"// 尾部标题对应的key
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *goodsList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加tableview
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    //2.初始化数据
    goodsList = @[
                  @{kTitle : @"精选特卖",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤", @"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"精选特卖精选特卖精选特卖"
                    },
                  @{kTitle : @"饭后(含有茶点)",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"饭后(含有茶点)饭后(含有茶点)饭后(含有茶点)"
                    },
                  @{kTitle : @"茶点(含有茶点)",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"饭后(含有茶点)饭后(含有茶点)饭后(含有茶点)12333"
                    },
                  @{kTitle : @"素材水果拼盘",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤",],
                    kFooter : @"素材水果拼盘素材水果拼盘素材水果拼盘"
                    },
                  @{kTitle : @"水果拼盘生鲜果",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤",],
                    kFooter : @"素材水果拼盘素材水果拼盘素材水果拼盘12333"
                    },
                  @{kTitle : @"拼盘",
                    xList : @[@"甜点组合"]
                    },
                  @{kTitle : @"烤鱼盘",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"烤鱼盘烤鱼盘烤鱼盘烤鱼盘"
                    },
                  @{kTitle : @"饮料",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤",@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"饮料饮料饮料饮料"
                    },
                  @{kTitle: @"小吃",
                    xList : @[@"甜点组合", @"毛肚"],
                    kFooter : @"小吃小吃小吃小吃小吃小吃"
                    },
                  @{kTitle : @"作料",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"作料作料作料作料作料作料"
                    },
                  @{kTitle : @"主食",
                    xList : @[@"甜点组合", @"毛肚", @"菌汤"],
                    kFooter : @"主食主食主食主食主食"
                    },
                  ];
}

//分区
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return goodsList.count;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //1.获取session组的title
    NSDictionary *dic = goodsList[section];
    
    //2.获取title中xlist
    NSArray *list = dic[xList];
    
    return list.count;
}

//显示行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //1.取出session 中row行文字数据
    NSDictionary *dic = goodsList[indexPath.section];
    NSArray *list = dic[xList];
    
    NSString *text = list[indexPath.row];
    //2.显示数据
    cell.textLabel.text = text;
    return cell;
}

//显示头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSDictionary *dic = goodsList[section];
    return dic[kTitle];
}

//显示尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    NSDictionary *dic = goodsList[section];
    return dic[kFooter];
}
@end
