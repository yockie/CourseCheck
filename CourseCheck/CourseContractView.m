//
//  ContractView.m
//  CourseCheck
//
//  Created by baidu on 15/10/14.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "CourseContractView.h"
#import "CourseContractInfo.h"

@interface CourseContractView ()
@property (retain, nonatomic) NSMutableArray *contractList;
@property (retain, nonatomic) UITableView *_tableView;

@end

@implementation CourseContractView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CourseContractInfo * locationInfo = [[CourseContractInfo alloc]initWithText:@"徐汇区医学院路69号11A（枫林路口地铁7、9号线肇嘉浜路站中山医院）" andDetailText:@"1.5Km" andImageName:@"location_image"];
    CourseContractInfo *mobileInfo = [[CourseContractInfo alloc]initWithText:@"13033133133" andDetailText:@"联系老师" andImageName:@"mobile_image"];
    //self.contractList = [NSMutableArray arrayWithObjects:contract1, contract2, nil];

    
    [self addContractBtnWithInfo:locationInfo withIndex:0];
    [self addContractBtnWithInfo:mobileInfo withIndex:1];

//    self._tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];//这里用self.frame是不对的
//    //设置tableview的数据源
//    self._tableView.dataSource = self;
//    //设置tableview的委托
//    self._tableView.delegate = self;
//    [self._tableView setBackgroundColor: [UIColor purpleColor]];
//    //设置tableview的背景图
//    //self._tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test_image"]];
//    [self addSubview:self._tableView];
    
    
}


- (void)addContractBtnWithInfo:(CourseContractInfo*)info withIndex:(int)index {
    
    int offsetY = 50*index;
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:info.imageName]];
    image.frame = CGRectMake(0, offsetY, 30, 50);
    [self addSubview:image];
    
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.text = info.text;
    textLabel.frame = CGRectMake(40, offsetY, 220, 50);
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:textLabel];
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.text = [info.detailText stringByAppendingString:@" >"];
    detailLabel.frame = CGRectMake(260, offsetY, 60, 50);
    detailLabel.numberOfLines = 0;
    detailLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:detailLabel];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, offsetY, self.bounds.size.width, self.bounds.size.height);
    [button addTarget:self action:@selector(clickContractBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}



- (void)clickContractBtn {
    NSLog(@"clickContractBtn");
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contractList count];
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
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:tableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    CourseContractInfo * contract = [self.contractList objectAtIndex:row];
    cell.textLabel.numberOfLines = 0;//label可以多行显示
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    int width = cell.textLabel.frame.size.width;
    int height = cell.textLabel.frame.size.height;
    cell.textLabel.frame = CGRectMake(cell.textLabel.frame.origin.x, cell.textLabel.frame.origin.y, 50, cell.textLabel.frame.size.height);
    
    width = cell.textLabel.frame.size.width;
    cell.textLabel.text = contract.text;
    cell.imageView.image = [UIImage imageNamed:contract.imageName];
    cell.detailTextLabel.text = contract.detailText;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIFont * myFont = [UIFont fontWithName:@"Arial" size:10.0];
    cell.textLabel.font = myFont;
    cell.detailTextLabel.font = myFont;
    [cell layoutSubviews];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseContractInfo *contract = [self.contractList objectAtIndex:[indexPath row]];
    NSString *msg = [[NSString alloc]initWithFormat:@"你选择的是:%@", contract.text];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert] ;
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:otherAction];
    //访问到根视图控制器
    [ [[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:alert animated:YES completion:nil];
}
@end
