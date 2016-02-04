//
//  ContractInfo.h
//  CourseCheck
//
//  Created by baidu on 15/10/19.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CourseContractInfo : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *detailText;
@property (nonatomic, copy) NSString *imageName;

- (CourseContractInfo *) initWithText:(NSString *)text andDetailText:(NSString *)detailText andImageName:(NSString *)imageName;

@end