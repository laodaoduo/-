//
//  ViewController.m
//  ZhengXing
//
//  Created by LiuTao on 15/12/30.
//  Copyright © 2015年 LiuTao. All rights reserved.
//

#import "ViewController.h"
//#import "define.h"

@interface ViewController ()

@end

@implementation ViewController
//@synthesize scrollView;
//@synthesize scrollView = ___scrollView;


#define S_MIN(a,b)       ((a)>(b)?(b):(a))

//#define S_DAYS(year)    (year%4==0&&year%100!=0)&&(year%400==0&&year%100==0)?29:28
//#define S_MIN(a,b)    if ((a)<(b)) {\
//    (a);\
//}else{\
//    (b);\
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSLog(@"--- min:%d",S_MIN(100-90,200));
//    
//    NSLog(@"--- year-2月:%d",S_DAYS(2000));
    
    // scrollerView
    
//    int year;
//    ;
    UIScrollView* tScrollView = nil;
    tScrollView = [[UIScrollView alloc] init];
    tScrollView.frame = CGRectMake(0, 0, f_Device_w, f_Device_h-f_i6real(100));
    tScrollView.backgroundColor = [UIColor yellowColor];
    [tScrollView setShowsHorizontalScrollIndicator:NO];
    [tScrollView setShowsVerticalScrollIndicator:NO];
    [tScrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
    [self.view addSubview:tScrollView];
    _scrollView = tScrollView;
    
    
    float currY = 0;

    //    自定义 广告条
    UIView* adView = [[UIView alloc] initWithFrame:CGRectMake(0, currY, f_Device_w, f_i6real(130))];
    adView.backgroundColor = [UIColor grayColor];
    [_scrollView addSubview:adView];
    currY += adView.frame.size.height;

    
//    添加模块入口
    //    <  #  #  >   tab键 切换
    id titles = @[@"文字1",@"文字2",@"文字3",@"文字4",];
    id imgs = @[@"main13.png",@"main14.png",@"main15.png",@"main16.png",];
    
    float btnW = f_Device_w/[titles count];
    float btnH = f_i6real(110);  // (系统预览 可以拉矩形框 估量元素尺寸)
    
    for (int i=0; i<[titles count]; i++) {
        UIButton* tButton = nil;
        tButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tButton.frame = CGRectMake(btnW*i, currY, btnW, btnH);
        tButton.tag = 100+i;
        [tButton addTarget:self action:@selector(channelClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:tButton];
        
        
        UIImageView* tImgView = nil;
        tImgView = [[UIImageView alloc] init];
        [tImgView setImage:GET_IMAGE([imgs objectAtIndex:i])];
        SET_IMAGE_SIZE(tImgView);

        tImgView.center = CGPointMake(btnW/2, btnH*0.4);
        [tButton addSubview:tImgView];

        CGRect frame = tImgView.frame;
        frame.size = CGSizeMake(tImgView.image.size.width/2, tImgView.image.size.height/2);
        tImgView.frame = frame;
        
        UILabel* tLabel = nil;
        tLabel = [[UILabel alloc] init];
        tLabel.frame = CGRectMake(0, btnH*0.7, btnW, btnH*0.3);
        tLabel.backgroundColor = [UIColor clearColor];
        [tLabel setText:[titles objectAtIndex:i]];
        [tLabel setFont:[UIFont systemFontOfSize:12.f]];
        [tLabel setTextColor:[UIColor grayColor]];
        [tLabel setTextAlignment:NSTextAlignmentCenter];
        [tButton addSubview:tLabel];
    }
    
    currY += btnH;
    
//    添加成功案例
    float left = f_i6real(20);
    float imgW = (f_Device_w-left*2.5)/2.f;
    float imgsH = (imgW-left/2)/2;
    
    UIButton* tButton = nil;
    tButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tButton.frame = CGRectMake(left, currY, imgW, imgW);
    tButton.tag = 200;
    [tButton setBackgroundImage:GET_IMAGE(@"main17.png") forState:UIControlStateNormal];
    [tButton addTarget:self action:@selector(imgClick:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:tButton];
    
    tButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tButton.frame = CGRectMake(left*1.5+imgW, currY, imgW, imgsH);
    tButton.tag = 201;
    [tButton setBackgroundImage:GET_IMAGE(@"main18.png") forState:UIControlStateNormal];
    [tButton addTarget:self action:@selector(imgClick:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:tButton];

    tButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tButton.frame = CGRectMake(left*1.5+imgW, currY+imgsH+left/2, imgW, imgsH);
    tButton.tag = 202;
    [tButton setBackgroundImage:GET_IMAGE(@"main19.png") forState:UIControlStateNormal];
    [tButton addTarget:self action:@selector(imgClick:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:tButton];
    
    currY += imgW;
    
    
//    点击进入所有问题
    float cellH = f_i6real(45);
    
    UIImageView* tImgView = nil;
    tImgView = [[UIImageView alloc] init];
    [tImgView setImage:GET_IMAGE(@"icon13.png")];
    SET_IMAGE_SIZE(tImgView);
    tImgView.center = CGPointMake(cellH/2+left/2, cellH/2+currY);
    [_scrollView addSubview:tImgView];
    
    UILabel* tLabel = nil;
    tLabel = [[UILabel alloc] init];
    tLabel.frame = CGRectMake(cellH, currY, f_Device_w/2, cellH);
    [tLabel setText:@"%99遇到的问题"];
    [tLabel setFont:[UIFont systemFontOfSize:13.f]];
    [tLabel setTextColor:[UIColor grayColor]];
    [tLabel setNumberOfLines:0];
    [_scrollView addSubview:tLabel];
    
    tLabel = [[UILabel alloc] init];
    tLabel.frame = CGRectMake(cellH, currY, f_Device_w-3*left-cellH, cellH);
    [tLabel setText:@"更多"];
    [tLabel setFont:[UIFont systemFontOfSize:13.f]];
    [tLabel setTextColor:[UIColor grayColor]];
    tLabel.textAlignment = NSTextAlignmentRight;
    [tLabel setNumberOfLines:0];
    [_scrollView addSubview:tLabel];
    
    
    tImgView = [[UIImageView alloc] init];
    [tImgView setImage:GET_IMAGE(@"icon14.png")];
    SET_IMAGE_SIZE(tImgView);
    tImgView.center = CGPointMake(f_Device_w-2*left, currY+cellH/2);
    [_scrollView addSubview:tImgView];
    
    
    currY+=cellH;

    UIView* tView = nil;
    tView = [[UIView alloc] init];
    tView.frame = CGRectMake(0, currY, f_Device_w, 0.5); // 分割线 一般不需要自动计算 高度或者宽度 0.5 / 1
    tView.backgroundColor = [UIColor darkGrayColor];
    [_scrollView addSubview:tView];

    
//    添加常见问题
    tImgView = [[UIImageView alloc] initWithFrame:CGRectMake(left, left/2+currY, 0, 0)];
    [tImgView setImage:GET_IMAGE(@"main20.png")];
    SET_IMAGE_SIZE(tImgView);
    [_scrollView addSubview:tImgView];
    
    float qLeft = tImgView.frame.size.width+left*2;
    tLabel = [[UILabel alloc] init];
    tLabel.frame = CGRectMake(qLeft, currY+left, f_Device_w-qLeft-left, tImgView.frame.size.height);
    [tLabel setText:@"1.关于整形手术你应该知道的三个要点\
     2.手术时间多久？用不用住院？\
     1.关于整形手术你应该知道的三个要点\
     2.手术时间多久？用不用住院？\
     3.手术时间多久？用不用住院？\
     3.手术时间多久？用不用住院？\
     3.手术时间多久？用不用住院？\
     3.手术时间多久？用不用住院？\
     3.手术时间多久？用不用住院？"];
    [tLabel setFont:[UIFont systemFontOfSize:13.f]];
    [tLabel setTextColor:[UIColor grayColor]];
    tLabel.textAlignment = NSTextAlignmentLeft;
    [tLabel setNumberOfLines:0];
    [_scrollView addSubview:tLabel];
    [tLabel sizeToFit];

    currY += (tLabel.frame.size.height+left);
    _scrollView.contentSize = CGSizeMake(f_Device_w, currY);
    
}


//----------------- 栏目点击

-(void) channelClick:(UIButton*)button
{
    NSInteger tag = [button tag]-100;
    // 栏目点击
    NSLog(@" 栏目点击 ：%d",tag);
    
}

-(void) imgClick:(UIButton*)button
{
    NSInteger tag = [button tag]-200;
    // 栏目点击
    NSLog(@" 栏目点击 ：%d",tag);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
