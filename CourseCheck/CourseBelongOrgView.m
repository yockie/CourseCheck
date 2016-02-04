//
//  BelongOrgnizationView.m
//  CourseCheck
//
//  Created by baidu on 15/10/20.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "CourseBelongOrgView.h"
#import "CourseContractInfo.h"

@interface CourseBelongOrgView()

@property (retain, nonatomic) NSArray *orgList;
@property (retain, nonatomic) UITableView *_tableView;
- (void) clickAllOrgBtn;
@end

@implementation CourseBelongOrgView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CourseContractInfo *locationInfo = [[CourseContractInfo alloc]initWithText:@"MEERBAR 舞蹈中心" andDetailText:@"徐汇区医学院路69号11A（枫林路口地铁7、9号线肇嘉浜路站中山医院）" andImageName:@"location_image"];
//    self.orgList = [[NSArray alloc]initWithObjects:org, nil];
//    
//    self._tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];//这里用self.frame是不对的
//    //设置tableview的数据源
//    self._tableView.dataSource = self;
//    //设置tableview的委托
//    self._tableView.delegate = self;
//    [self._tableView setBackgroundColor: [UIColor purpleColor]];
//    //设置tableview的背景图
//    //self._tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test_image"]];
//    [self addSubview:self._tableView];
    
    [self addContractBtnWithInfo:locationInfo];
    
    UIButton * allOrg = [[UIButton alloc]initWithFrame:CGRectMake(0, 70, self.frame.size.width, 30)];
    allOrg.backgroundColor = [UIColor whiteColor];
    [allOrg setTitle:@"全部2家分店" forState:UIControlStateNormal];
    [allOrg addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [allOrg setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    allOrg.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    allOrg.titleLabel.font = [UIFont systemFontOfSize:11.0];
    [self addSubview:allOrg];
    
}


- (void)addContractBtnWithInfo:(CourseContractInfo*)info {
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:info.imageName]];
    image.frame = CGRectMake(0, 0, 40, 70);
    [self addSubview:image];
    
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.text = info.text;
    textLabel.frame = CGRectMake(50, 0, 250, 35);
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:textLabel];
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.text = info.detailText;
    detailLabel.frame = CGRectMake(50, 35, 250, 35);
    detailLabel.numberOfLines = 0;
    detailLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:detailLabel];
    
    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.text = @">";
    rightLabel.frame = CGRectMake(300, 0, 10, 70);
    rightLabel.numberOfLines = 0;
    rightLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:rightLabel];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


- (void)clickBtn {
    NSLog(@"clickBtn");
    UIViewController *currViewController = [self getCurrViewControllerByView:self];
    
    NSString *msg = [[NSString alloc]initWithFormat:@"响应点击事件"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert] ;
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:otherAction];
    //访问到根视图控制器
    [ currViewController presentViewController:alert animated:YES completion:nil];
}

-(UIViewController *)getCurrViewControllerByView:(UIView *)sourceView {
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}



- (void) clickAllOrgBtn {
    NSString *msg = [[NSString alloc]initWithFormat:@"跳到全部分店页"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert] ;
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:otherAction];
    //访问到根视图控制器
    [ [[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:alert animated:YES completion:nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.orgList count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//实现tabview添加数据源，返回tabview的行数，返回各行cell实例
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"tableIdentifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:tableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    CourseContractInfo * org = [self.orgList objectAtIndex:row];
    cell.textLabel.numberOfLines = 0;//label可以多行显示
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.frame = CGRectMake(cell.textLabel.frame.origin.x, cell.textLabel.frame.origin.y, 50, cell.textLabel.frame.size.height);
    cell.textLabel.text = org.text;
    cell.imageView.image = [UIImage imageNamed:org.imageName];
    cell.detailTextLabel.text = org.detailText;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIFont * myFont = [UIFont fontWithName:@"Arial" size:10.0];
    cell.textLabel.font = myFont;
    cell.detailTextLabel.font = myFont;
    [cell layoutSubviews];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseContractInfo *org = [self.orgList objectAtIndex:[indexPath row]];
    NSString *msg = [[NSString alloc]initWithFormat:@"你选择的是:%@", org.text];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert] ;
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:otherAction];
    //访问到根视图控制器
    [ [[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:alert animated:YES completion:nil];
}



@end
