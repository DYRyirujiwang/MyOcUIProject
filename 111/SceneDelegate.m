//
//  SceneDelegate.m
//  111
//
//  Created by dongyaru on 2026/1/30.
//

#import "SceneDelegate.h"
#import "ViewController.h" // 你的根页面控制器

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
        
        // 2. 创建应用窗口，绑定到当前场景
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        
        // 3. 创建根页面控制器（如首页 ViewController）
        ViewController *rootVC = [[ViewController alloc] init];
        
        // 4. 创建导航控制器，将根页面作为其 rootViewController
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
        
        // 可选：自定义导航栏样式（如隐藏默认导航栏、设置背景色）
        navVC.navigationBar.barTintColor = [UIColor whiteColor]; // 导航栏背景色
        navVC.navigationBar.tintColor = [UIColor blackColor];     // 导航栏按钮颜色
        navVC.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17]}; // 标题字体
        // navVC.navigationBar.hidden = YES; // 隐藏导航栏（按需）
        
        // 5. 将导航控制器设置为窗口的根视图控制器
        self.window.rootViewController = navVC;
        
        // 6. 显示窗口（必须调用，否则页面不显示）
        [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
