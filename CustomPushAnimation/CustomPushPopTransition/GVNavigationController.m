//
//  GVNavigationController.m
//  CustomPushAnimation
//
//  Created by admin on 2021/6/15.
//

#import "GVNavigationController.h"

#define kDuration 0.5

@interface GVNavigationController ()

@end

@implementation GVNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s line:%d", __func__, __LINE__);
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (animated) {
        CATransition *transition = [[CATransition alloc] init];
        transition.duration = kDuration;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    [super pushViewController:viewController animated:NO];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    if (animated) {
        [self.view.layer addAnimation:[self popTransition] forKey:nil];
    }
    return [super popViewControllerAnimated:NO];
}

- (NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (animated) {
        [self.view.layer addAnimation:[self popTransition] forKey:nil];
    }
    return [super popToViewController:viewController animated:NO];
}

- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    if (animated) {
        [self.view.layer addAnimation:[self popTransition] forKey:nil];
    }
    return [super popToRootViewControllerAnimated:NO];
}

// pop方法有三个就把动画抽出来放到一起了
- (CATransition *)popTransition {
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = kDuration;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    return transition;
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
