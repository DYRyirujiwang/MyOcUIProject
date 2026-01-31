//
//  ViewController.m
//  selfLearnOc
//
//  Created by dongyaru on 2026/1/30.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc ] initWithFrame:CGRectMake(100, 200, 50, 100)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(handleTap:) forControlEvents:UIControlEventTouchUpInside];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
       // 设置响应格式（支持 JSON）
       manager.responseSerializer = [AFJSONResponseSerializer serializer];
       
       // 2. 发起 GET 请求（示例接口，可替换为自己的接口）
       NSString *url = @"https://httpbin.org/get";
       [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           // 请求成功回调
           NSLog(@"请求成功：%@", responseObject);
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           // 请求失败回调
           NSLog(@"请求失败33333：%@", error);
       }];
    NSLog(@"请求尝试合并");
    NSLog(@"请求尝试合并2");
    NSLog(@"我提交一次了");


}


-(void)handleTap:(UIButton *)sender {
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

@end

