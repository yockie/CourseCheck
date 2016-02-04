//
//  CourseViewController.m
//  lvcha
//
//  Created by baidu on 15/10/19.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "CourseViewController.h"
#import "ScrollPicturesView.h"
#import "CourseIntroductionView.h"
#import "CourseContractView.h"
#import "CourseDetailView.h"
#import "CourseBelongOrgView.h"


@interface CourseViewController ()

@property (strong, nonatomic) UIScrollView *bgScrollView;
@property (strong, nonatomic) ScrollPicturesView *picturesView;
@property (strong, nonatomic) CourseIntroductionView *introductionView;
@property (strong, nonatomic) CourseContractView *contractView;
@property (strong, nonatomic) CourseDetailView * detailView;
@property (strong, nonatomic) CourseBelongOrgView * orgView;
@property (strong, nonatomic) UIButton *orderCourseBtn;
@end



@implementation CourseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"课程详情";
    
    [self viewConfig];
    
}

- (void) viewConfig {
    
    self.navigationController.navigationBarHidden = NO;
    
    //1.创建UIScrollView
    self.bgScrollView = [[UIScrollView alloc]init];
    self.bgScrollView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];//[UIColor redColor];
    [self.view addSubview:self.bgScrollView];
    self.bgScrollView.bounces = NO;
    
    
    self.picturesView = [[ScrollPicturesView alloc]init];
    [self.bgScrollView addSubview:self.picturesView];
    
    self.introductionView = [[CourseIntroductionView alloc] init];
    self.introductionView.backgroundColor = [UIColor whiteColor];
    [self.bgScrollView addSubview:self.introductionView];
    
    self.contractView = [[CourseContractView alloc]init];
    self.contractView.backgroundColor = [UIColor whiteColor];
    [self.bgScrollView addSubview:self.contractView];
    
    self.detailView = [[CourseDetailView alloc]init];
    self.detailView.backgroundColor = [UIColor whiteColor];
    [self.bgScrollView addSubview:self.detailView];
    
    self.orgView = [[CourseBelongOrgView alloc]init];
    self.orgView.backgroundColor = [UIColor whiteColor];
    [self.bgScrollView addSubview:self.orgView];
    
    self.orderCourseBtn = [[UIButton alloc]init];
    [self.orderCourseBtn setTitle:@"预约课程" forState:UIControlStateNormal];
    [self.orderCourseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.orderCourseBtn setBackgroundColor:[UIColor blueColor]];
    self.orderCourseBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    [self.view addSubview:self.orderCourseBtn];
    
    
    //隐藏滚动条
    self.bgScrollView.showsHorizontalScrollIndicator = NO;
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    //self.bgScrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    int wScreen = self.view.bounds.size.width;
    int hScreen = self.view.bounds.size.height;
    
    double verticalSpace = 5.0;
    
    //frame中的size指UIScrollView的可视范围
    self.bgScrollView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height-35);
    self.bgScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    
    int picturesViewHeight = 150;
    self.picturesView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, picturesViewHeight);
    
    int introductionViewHeight = 250;
    self.introductionView.frame = CGRectMake(self.view.frame.origin.x, self.picturesView.frame.origin.y+self.picturesView.frame.size.height+verticalSpace, self.view.frame.size.width, introductionViewHeight);
    
    int contractViewHeight = 100;
    self.contractView.frame = CGRectMake(self.view.frame.origin.x, self.introductionView.frame.origin.y+self.introductionView.frame.size.height+verticalSpace, self.view.frame.size.width, contractViewHeight);
    
    int detailViewHeight = 300;
    self.detailView.frame = CGRectMake(self.view.frame.origin.x, self.contractView.frame.origin.y+self.contractView.frame.size.height+verticalSpace, self.view.frame.size.width, detailViewHeight);
    
    int orgViewHeight = 100;
    self.orgView.frame = CGRectMake(self.view.frame.origin.x, self.detailView.frame.origin.y+self.detailView.frame.size.height+verticalSpace, self.view.frame.size.width, orgViewHeight);
    
    int wOrderCourseBtn = 150, hOrderCourceBtn = 30;
    self.orderCourseBtn.frame = CGRectMake((wScreen - wOrderCourseBtn) / 2, hScreen - hOrderCourceBtn - verticalSpace, wOrderCourseBtn, hOrderCourceBtn);
    
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
