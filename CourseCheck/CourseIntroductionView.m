//
//  CourseIntroductionView.m
//  lvcha
//
//  Created by baidu on 15/10/20.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "CourseIntroductionView.h"

@implementation CourseIntroductionView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //    int offsetX = 20;
    //
    //    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(offsetX, 0, 300, 30)];
    //    nameLabel.text = @"拉丁初级班";
    //    [self addSubview:nameLabel];
    //
    //
    //    UILabel *orgLabel = [[UILabel alloc]initWithFrame:CGRectMake(offsetX, 50, 300, 30)];
    //    orgLabel.text = @"MEERBAR 舞蹈中心（徐汇店）";
    //    [self addSubview:orgLabel];
    
    //获得nib视图数组
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"IntroductionView" owner:self options:nil];
    //得到第一个UIVIew
    UIView *tmpView = [nib objectAtIndex:0];
    tmpView.frame = self.bounds;
    [self addSubview:tmpView];
    
}

@end
