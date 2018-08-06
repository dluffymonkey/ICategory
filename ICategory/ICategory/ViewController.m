//
//  ViewController.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "ViewController.h"
#import "ICategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [UILabel labelWithText:@"减免券" textColor:ColorWithHex(0x666666) fontSize:12.f];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(50, 100, 50, 20);
    label.backgroundColor = RandomColor;
    label.cornerRadius = 10.f;
    [self.view addSubview:label];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, 50, 20)];
    img.image = [UIImage imageWithUIView:label];
    [self.view addSubview:img];
    
    UILabel *lal= [[UILabel alloc] initWithFrame:CGRectMake(20, 200,CGRectGetWidth(self.view.frame)-40,210)];
    lal.numberOfLines = 0;
    [self.view addSubview:lal] ;
    NSMutableAttributedString *attristr = [[NSMutableAttributedString alloc] initWithString :@"今日头条是一款基😁于数据挖掘的推荐😁引"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict [NSFontAttributeName] = [UIFont systemFontOfSize:15];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    dict[NSParagraphStyleAttributeName] = paragraphStyle;
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageWithUIView:label];
    attachment.bounds = CGRectMake(0,-5,50,20);
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attachment];
    [attristr insertAttributedString:stringImage atIndex:0];
    dict[NSAttachmentAttributeName] = attachment ;
    lal.attributedText = [[NSAttributedString alloc] initWithString:[attristr string] attributes:dict];
    [lal sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
