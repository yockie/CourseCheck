//
//  CourseViewController.m
//  CourseCheck
//
//  Created by baidu on 15/10/13.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "MainpageViewController.h"
#import "CourseViewController.h"

@interface MainpageViewController ()

@end

@implementation MainpageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController.navigationBar setTranslucent:NO];
    self.title = @"首页";
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    
    //self.view.backgroundColor = [UIColor whiteColor];
    
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

- (IBAction)gotoCourseDetail:(id)sender {
    CourseViewController *courseController = [[CourseViewController alloc]init];
    //int width = self.view.frame.size.width;
    courseController.view.frame = self.view.bounds;
    [self.navigationController pushViewController:courseController animated:YES];
    courseController.info = @"course id";
    
}
@end
