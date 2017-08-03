//
//  ViewController.m
//  制作动图
//
//  Created by WangXueqi on 17/8/3.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    [self imageGif];
}

//UIImageView实现gif动画
- (void)imageGif {

    UIImageView * gifImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    gifImage.center = self.view.center;
    [self.view addSubview:gifImage];
    
    NSMutableArray * images = [NSMutableArray array];
    for (int i=1; i < 5; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"sound_%d",i]]];
    }
    gifImage.animationImages = images;
    gifImage.animationDuration = 2.0;//完成一次时间
    gifImage.animationRepeatCount = NSUIntegerMax;//播放次数
    [gifImage startAnimating];
    
}

//UIWebView实现.gif动画文件的播放
- (void)webViewGif {

    CGSize size = [UIImage imageNamed:@"image.gif"].size;
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    webView.center = self.view.center;
    webView.userInteractionEnabled = NO;
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
    NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"image" ofType:@"gif"]];
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
