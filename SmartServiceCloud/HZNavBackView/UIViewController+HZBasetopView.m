//
//  UIViewController+HZBasetopView.m
//  HZNavBackView
//
//  Created by 何泽的mac on 2019/2/3.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import "UIViewController+HZBasetopView.h"
#import <objc/runtime.h>
#import "UIView+HZGradient.h"
//定义topview关联的key
static const char *key = "hz_topview";

@implementation UIViewController (HZBasetopView)

-(void)setHz_topView:(UIImageView *)hz_topView{
    objc_setAssociatedObject(self, key, hz_topView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIImageView *)hz_topView{
    return objc_getAssociatedObject(self, key);
}

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class targetClass = [self class];
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(hz_viewDidLoad);
        swizzleMethod(targetClass, originalSelector, swizzledSelector);
    });
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    IMP swizzledImp = method_getImplementation(swizzledMethod);
    char *swizzledTypes = (char *)method_getTypeEncoding(swizzledMethod);
    
    IMP originalImp = method_getImplementation(originalMethod);
    
    char *originalTypes = (char *)method_getTypeEncoding(originalMethod);
    BOOL success = class_addMethod(class, originalSelector, swizzledImp, swizzledTypes);
    if (success) {
        class_replaceMethod(class, swizzledSelector, originalImp, originalTypes);
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)hz_viewDidLoad{
    [self hz_viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (self.navigationController.navigationBar.translucent) {
        [self.navigationController.navigationBar hz_setElementsHidden];
        [self load_topview];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)orientChange:(NSNotification *)notification{
    [self hz_reload_topview];
}

-(void)setHz_edgesForExtendedLayout:(UIRectEdge)hz_edgesForExtendedLayout{
    self.edgesForExtendedLayout = hz_edgesForExtendedLayout;
    [self hz_reload_topview];
}

-(UIRectEdge)hz_edgesForExtendedLayout{
    return self.hz_edgesForExtendedLayout;
}
- (void)setHz_changeTopViewHeight:(CGFloat)hz_changeTopViewHeight{
    CGRect rect = self.hz_topView.frame;
    self.hz_topView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height + hz_changeTopViewHeight);
    [self.view bringSubviewToFront:self.hz_topView];
}

-(CGFloat)hz_changeTopViewHeight{
    return self.hz_changeTopViewHeight;
}

-(void)load_topview{    
    UIImageView * hz_topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kHZScreenWidth, kHZTopHeight)];
    hz_topView.userInteractionEnabled = YES;
    [self.view addSubview:hz_topView];
    self.hz_topView = hz_topView;
}

-(void)hz_reload_topview{
    switch (self.edgesForExtendedLayout) {
        case UIRectEdgeNone:
            self.hz_topView.frame = CGRectMake(0, -kHZTopHeight, kHZScreenWidth, kHZTopHeight);
            break;
        case UIRectEdgeTop:
            self.hz_topView.frame = CGRectMake(0, 0, kHZScreenWidth, kHZTopHeight);
            break;
        case UIRectEdgeAll:
            self.hz_topView.frame = CGRectMake(0, 0, kHZScreenWidth, kHZTopHeight);
            break;
        default:
            self.hz_topView.frame = CGRectMake(0, -kHZTopHeight, kHZScreenWidth, kHZTopHeight);
            break;
    }
}

-(void)hz_GradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    if (self.hz_topView) {
        [self.hz_topView hz_setGradientBackgroundWithColors:colors startPoint:startPoint endPoint:endPoint];
    }
}

-(void)hz_NavigationLeftimageBut:(UIImage *)image action:(SEL)selector{
    UIBarButtonItem * leftBut = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:selector];
    self.navigationItem.leftBarButtonItem = leftBut;
    
}

-(void)hz_NavigationLefttitleBut:(NSString *)string action:(SEL)selector{
    UIBarButtonItem * leftBut = [[UIBarButtonItem alloc]initWithTitle:string style:UIBarButtonItemStylePlain target:self action:selector];
    self.navigationItem.leftBarButtonItem =leftBut;
    
}

-(void)hz_NavigationRightimageBut:(UIImage *)image action:(SEL)selector{
    UIBarButtonItem * rightBut = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:selector];
    self.navigationItem.rightBarButtonItem = rightBut;
    
}

-(void)hz_NavigationRighttitleBut:(NSString *)string action:(SEL)selector{
    UIBarButtonItem * rightBut = [[UIBarButtonItem alloc]initWithTitle:string style:UIBarButtonItemStylePlain target:self action:selector];
    self.navigationItem.rightBarButtonItem =rightBut;
}

@end
