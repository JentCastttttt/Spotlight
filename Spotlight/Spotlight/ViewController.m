//
//  ViewController.m
//  Spotlight
//
//  Created by JianRongCao on 15/10/28.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createSpotlight];
}

- (void)createSpotlight
{
    CSSearchableItemAttributeSet *set = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeImage];
    set.title = @"Image格式";
    set.contentDescription = @"this is describe";
    set.keywords = [NSArray arrayWithObjects:@"Hello",@"才",@"Name",nil];
    UIImage *icon = [UIImage imageNamed:@"a.png"];
    NSData *imgeData = [NSData dataWithData:UIImagePNGRepresentation(icon)];
    set.thumbnailData = imgeData;
    set.thumbnailURL = [NSURL URLWithString:@"www.baidu.com"];
    CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"com.suning" domainIdentifier:@"com.domain.suning" attributeSet:set];
    
    
    CSSearchableItemAttributeSet *setData = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeItem];
    setData.title = @"Item格式";
    setData.contentDescription = @"this is describe Item";
    setData.keywords = [NSArray arrayWithObjects:@"Moto",@"流量",@"power",nil];
    UIImage *iconSec = [UIImage imageNamed:@"b.png"];
    NSData *imgeDataSec = [NSData dataWithData:UIImagePNGRepresentation(iconSec)];
    set.thumbnailData = imgeDataSec;
    set.thumbnailURL = [NSURL URLWithString:@"www.google.com"];
    CSSearchableItem *itemSec = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"com.suning.chinaMobile" domainIdentifier:@"com.domain.suning.chinaMobile" attributeSet:setData];
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[item,itemSec] completionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",item);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
