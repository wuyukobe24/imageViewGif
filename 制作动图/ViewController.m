//
//  ViewController.m
//  制作动图
//
//  Created by WangXueqi on 17/8/3.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import <UIImage+GIF.h>
@interface ViewController ()
@property(nonatomic,strong)UIImageView * gifImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self imageGif];
    [self webViewGif];
}

//UIImageView实现gif动画
- (void)imageGif {

    UIImageView * gifImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 20)];
    gifImage.center = self.view.center;
    [self.view addSubview:gifImage];
    self.gifImage = gifImage;
    
    NSInteger A = 1;
    if (A<0) {
        //多图片
        [self creatRightButton];
        NSMutableArray * images = [NSMutableArray array];
        for (int i=2; i < 14; i++) {
            [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"spot_%d",i]]];
        }
        gifImage.animationImages = images;
        gifImage.animationDuration = 1.0;//完成一次时间
        gifImage.animationRepeatCount = NSUIntegerMax;//播放次数
    }else{
        //gif动图
        NSString *path = [[NSBundle mainBundle] pathForResource:@"spot" ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        [self.gifImage setImage:[UIImage sd_animatedGIFWithData:data]];
    }
}

//UIWebView实现.gif动画文件的播放
- (void)webViewGif {

    CGSize size = [UIImage imageNamed:@"spot.gif"].size;
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    webView.center = self.view.center;
    webView.userInteractionEnabled = NO;
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
    NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"spot" ofType:@"gif"]];
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
}

- (void)creatRightButton{
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)rightButtonClick:(UIBarButtonItem *)sender {
    
    if (![self.gifImage isAnimating]) {
        [self.gifImage startAnimating];
    }else{
        [self.gifImage stopAnimating];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
