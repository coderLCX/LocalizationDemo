//
//  ViewController.m
//  LocalizationDemo
//
//  Created by por on 2017/3/10.
//  Copyright © 2017年 liuchunxi. All rights reserved.
//


#import "ViewController.h"

typedef NS_ENUM(NSInteger, LocalizedType) {
    LocalizedTypeChinese, //中文
    LocalizedTypeEnglish, //英文
};


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *switchLanguageButton;

@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (assign, nonatomic) LocalizedType localizedType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    //参考资料：
    //1.http://www.cocoachina.com/ios/20151120/14258.html
    //2.http://www.jianshu.com/p/88c1b65e3ddb
    
    NSArray *langArr1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    
    if ([langArr1.firstObject isEqualToString:@"zh-Hans-CN"]) {
        self.localizedType = LocalizedTypeChinese;
    }
    else {
        self.localizedType = LocalizedTypeEnglish;
    }
    
    NSLog(@"当前语言：%@",langArr1);
    
    [self.switchLanguageButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self localizedWithKey:@"label1" ofLabel:self.label1];
//    [self localizedWithKey:@"label2" ofLabel:self.label2];
//    [self localizedWithKey:@"label3" ofLabel:self.label3];
}

- (void)click:(UIButton *)button {
    if (self.localizedType == LocalizedTypeChinese) {
        [self switchLanguageWithLocalizedType:LocalizedTypeEnglish];
    }
    else {
        [self switchLanguageWithLocalizedType:LocalizedTypeChinese];
    }

    [self localizedWithKey:@"label1" ofLabel:self.label1];
    [self localizedWithKey:@"label2" ofLabel:self.label2];
    [self localizedWithKey:@"label3" ofLabel:self.label3];
}

- (void)switchLanguageWithLocalizedType:(LocalizedType)localizedType {
    NSArray *langArr1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSLog(@"语言切换之前：%@",langArr1);
    
    NSArray *lans;
    switch (localizedType) {
        case LocalizedTypeChinese:
            self.localizedType = LocalizedTypeChinese;
            lans = @[@"zh-Hans-CN"];
            break;
            
        case LocalizedTypeEnglish:
            self.localizedType = LocalizedTypeEnglish;
            lans = @[@"en-CN"];
            break;
            
        default:
            break;
    }
    
    // 切换语言
    [[NSUserDefaults standardUserDefaults] setObject:lans forKey:@"AppleLanguages"];
    
    NSArray *langArr2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSLog(@"语言切换之后：%@",langArr2);

}

- (void)localizedWithKey:(NSString *)key ofLabel:(UILabel *)label {
//    NSString *text = NSLocalizedString(key, nil);
    NSString *text = NSLocalizedStringFromTable(key, @"Localizable", nil);
    label.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
