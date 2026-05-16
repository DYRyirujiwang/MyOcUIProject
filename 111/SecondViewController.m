//
//  SecondViewController.m
//  111
//
//  Created by dongyaru on 2026/1/30.
//

#import "SecondViewController.h"

//view-show libraay 出来控件
//view- inspector-- connection去关联view
//editor -assitant就出来左边 xib  右边代码


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.btn setTitle:@"点击我" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


// 1. 声明按钮点击事件方法（IBAction 是关键，可被 XIB 识别）
- (IBAction)btnClickHandler:(UIButton *)sender {
    // 这里写按钮点击后的业务逻辑（核心）
    NSLog(@"按钮被点击了！按钮标题：%@", sender.currentTitle);
    // 示例逻辑：跳转页面、修改UI、发起网络请求等
    // 比如修改按钮标题
    [sender setTitle:@"已点击" forState:UIControlStateNormal];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
