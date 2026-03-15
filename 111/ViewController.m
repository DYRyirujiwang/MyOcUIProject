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
    
      NSLog(@"我提交代码次了");

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
    //本次提交 如果只是提交到本地，选择本次提交 选择重置 没有反应，选择本次提交，选择回滚，显示revert  修改的内容没有了 如果选择本次条的上一次的提交记录，选择重置 到上一次的那个提交，本次的提交会来到暂存区
    NSLog(@"请求尝试合并5555");
    
    //远端，推到远端 选择本次 选择重置没有反应，选择回滚，也是没有修改记录了 显示了revert， 选择了上一次的重置到这个地方，本次修改记录保留在暂存区， 如果没有修改 ，直接提交修改commit记录就可以了 ， 如果修改了 显示冲突， 需要先拉取，然后修改冲突 然后提交
    NSLog(@"推送到远端测试");

    NSLog("jkdhsjhshsdh")



}


-(void)handleTap:(UIButton *)sender {
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

@end

