//
//  ContractInfo.m
//  CourseCheck
//
//  Created by baidu on 15/10/19.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "CourseContractInfo.h"

@implementation CourseContractInfo

@synthesize text;
@synthesize detailText;
@synthesize imageName;

- (CourseContractInfo *) initWithText:(NSString *)text andDetailText:(NSString *)detailText andImageName:(NSString *)imageName {
    if(self = [super init]) {
        self.text = text;
        self.detailText = detailText;
        self.imageName = imageName;
    }
    
    return self;
}

@end
