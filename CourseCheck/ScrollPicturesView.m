//
//  ScrollPicturesView.m
//  lvcha
//
//  Created by baidu on 15/10/19.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "ScrollPicturesView.h"


@interface ScrollPicturesView ()
@property (strong, nonatomic) UIPageControl * pageControl;
@property (strong, nonatomic) NSArray *imageNameList;
@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIImageView *imageView;

- (IBAction)pageControlChanged:(id)sender ;
- (void) createPages;

@end

@implementation ScrollPicturesView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 
 */

- (void)drawRect:(CGRect)rect {
    self.imageNameList = [[NSMutableArray alloc] initWithObjects:@"test_image", @"test_image2", @"test_image3", nil];
    
    
    int width = self.frame.size.width;
    int height = self.frame.size.height;
    int pageControlHeight = 4;
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];//CGRectMake(0, 0, width, height)
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake([self.imageNameList count]*width, 1);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, height-pageControlHeight, width, pageControlHeight)];
    //有几个可以切换的视图，即几个圆点
    self.pageControl.numberOfPages = [self.imageNameList count];
    //当前视图的圆点的序号
    self.pageControl.currentPage = 0;
    self.pageControl.hidesForSinglePage = YES;
    //self.pageControl.backgroundColor = [UIColor greenColor];
    self.pageControl.enabled = YES;
    self.pageControl.opaque = 1;
    //设置非选中页的圆点颜色
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self.pageControl addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.pageControl];
    
    
    //
    //    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height-pageControlHeight)];
    //    [self.imageView setImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:self.pageControl.currentPage]]];
    //    [self addSubview:self.imageView];
    
    [self createPages];
    
}


- (IBAction)pageControlChanged:(id)sender {
    int page = self.pageControl.currentPage;
    //[self.imageView setImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:page]]];
    
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}


- (void) createPages {
    CGRect pageRect = self.scrollView.frame;
    
    //create pages
    UIView *page1 = [[UIView alloc]initWithFrame:pageRect];
    page1.backgroundColor = [UIColor whiteColor];
    //设置view的背景，方法1：在view上放一个imageView来显示背景图片，此方法占内存较少
    //这里用的是方法2：通过改变view.backgroundColor的值来达到同样的效果，但占内存较多
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:0]]];
    imageView1.frame = self.bounds;
    imageView1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [page1 insertSubview:imageView1 atIndex:0];
    //[page1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"my_account_set"]]];
    
    UIView *page2 = [[UIView alloc]initWithFrame:pageRect];
    page2.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:1]]];
    imageView2.frame = self.bounds;
    imageView2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [page2 insertSubview:imageView2 atIndex:0];
    //[page2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:1]]]];
    
    UIView *page3 = [[UIView alloc]initWithFrame:pageRect];
    page3.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:2]]];
    imageView3.frame = self.bounds;
    imageView3.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [page3 insertSubview:imageView3 atIndex:0];
    //[page3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[self.imageNameList objectAtIndex:2]]]];
    
    [self loadScrollViewWithPage:page1];
    [self loadScrollViewWithPage:page2];
    [self loadScrollViewWithPage:page3];
    
    
}

- (void) loadScrollViewWithPage:(UIView *)page {
    int pageCount = [[self.scrollView subviews]count];
    
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = bounds.size.width*pageCount;
    bounds.origin.y = 0;
    
    page.frame = bounds;
    [self.scrollView addSubview:page];
}


- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth/2 ) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}


@end