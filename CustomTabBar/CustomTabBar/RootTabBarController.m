//
//  RootTabBarController.m
//  CustomTabBar
//
//  Created by bhqm on 2017/11/8.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "RootTabBarController.h"
#import "commTabBar.h"

#import "MainViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "MineViewController.h"
//16进制转UIColor
#define HexAlphaColor(x, a)         [UIColor colorWithRed:((float)(((x) & 0xFF0000) >> 16))/255.0f \
green:((float)(((x) & 0xFF00) >> 8))/255.0f \
blue:((float)((x) & 0xFF))/255.0f \
alpha:(a)]

@interface RootTabBarController ()<commTabBarDelegate>

@property(nonatomic,strong) commTabBar *comtabbar ;

@end

@implementation RootTabBarController
-(commTabBar *)comtabbar{
    if (!_comtabbar) {
        _comtabbar = [[commTabBar alloc] init];
        _comtabbar.delagate = self;
    }
    return _comtabbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTabBar];

}
- (void)setTabBar {
    /**** 添加子控制器 ****/
    [self addChildVC:[[MainViewController alloc] init] andtabTitle:@"首页" navTitle:@"首页" andimage:@"bottom-0" andseledimage:@"bottomon-0"];
    [self addChildVC:[[SecondViewController alloc] init] andtabTitle:@"视频" navTitle:@"视频" andimage:@"bottom-1" andseledimage:@"bottomon-1"];
    [self addChildVC:[[ThirdViewController alloc] init] andtabTitle:@"天气" navTitle:@"天气" andimage:@"bottom-3" andseledimage:@"bottomon-3"];
    [self addChildVC:[[MineViewController alloc] init] andtabTitle:@"我的" navTitle:@"我的" andimage:@"bottom-4" andseledimage:@"bottomon-4"];

    [self setValue:self.comtabbar forKeyPath:@"tabBar"];
}
- (void)addChildVC:(UIViewController *)child andtabTitle:(NSString *)tabtitle navTitle:(NSString*)navtitle andimage:(NSString *)image andseledimage:(NSString *)seledimage {
    
    child.tabBarItem.title = tabtitle;
    child.navigationItem.title = navtitle;
    //取消渲染
    child.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    child.tabBarItem.selectedImage = [[UIImage imageNamed:seledimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [child.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HexAlphaColor(0xfc4f4f, 1)} forState:UIControlStateSelected];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:child];
    
    nav.navigationBar.barTintColor = HexAlphaColor(0xfc4f4f, 1);
    nav.navigationBar.tintColor = [UIColor redColor];
    
    [child.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self addChildViewController:nav];
}

#pragma mark - delegate

-(void)pushButtonClickAction:(BOOL)selected{
    NSLog(@"点击了+号");
}











@end
