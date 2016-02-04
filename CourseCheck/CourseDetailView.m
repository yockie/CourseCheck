//
//  CourseDetailView.m
//  lvcha
//
//  Created by baidu on 15/10/20.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "CourseDetailView.h"

@implementation CourseDetailView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGRect rt = [UIScreen mainScreen].bounds;
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, rt.size.width, 30)];
    label.text = @"课程详细内容";
    [self addSubview:label];
    
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"location_image"]];
    imageView1.frame = CGRectMake(0, 30, rt.size.width, imageView1.image.size.height);
    imageView1.contentMode = UIViewContentModeCenter;
    [self addSubview:imageView1];
    
    
    NSString *detailContent = @"拉丁初级班级共有6节课。上课时间可与老师联系沟通协调。初级班课程适合刚接触拉丁舞，对拉丁舞有兴趣的还是。教学目标培养儿童一台，培养儿童对拉丁舞的兴趣。\n课程特色是每个月会邀请职业拉丁舞着进行专业指导。再课程结束会安排一次拉丁舞表演。对有资质和有兴趣的孩子，建议继续报名我们的终极版和进阶版。\n为了保证授课质量，每节课上课人数不超过5人。我们专业的老师会针对不同孩子的热值有针对性的教学";
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(0, 30+imageView1.image.size.height, self.frame.size.width, [self heightForString:detailContent fontSize:11 andWidth:self.frame.size.width])];
    content.text = detailContent;
    content.font = [UIFont systemFontOfSize:11];
    content.numberOfLines = 0;
    [self addSubview:content];
    
}


-(float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width {
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize]constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                             lineBreakMode:UILineBreakModeCharacterWrap];
    return sizeToFit.height;
}


@end
