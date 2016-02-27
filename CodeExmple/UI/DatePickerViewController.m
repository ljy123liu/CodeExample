//
//  DatePickerViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/22/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (nonatomic,strong)NSDateFormatter *dateFormatter;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)UIDatePicker *datePicker;
@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    self.dateFormatter.timeStyle = NSDateFormatterShortStyle;
    [self configureDatePicker];
}

- (void)configureDatePicker {
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(50, 100, 300, 100)];
    [self.view addSubview:self.datePicker];
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    NSDate *now = [NSDate date];
    self.datePicker.minimumDate = now;
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = 7;
    
    NSDate *sevenDaysFromNow = [currentCalendar dateByAddingComponents:dateComponents toDate:now options:0];
    self.datePicker.maximumDate = sevenDaysFromNow;
    
    self.datePicker.minuteInterval = 1;
    
    [self.datePicker addTarget:self action:@selector(updateDatePickerLabel) forControlEvents:UIControlEventValueChanged];
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(self.datePicker.frame)+30, 200, 20)];
    [self.view addSubview:self.dateLabel];
    
    [self updateDatePickerLabel];
}

- (void)updateDatePickerLabel {
    self.dateLabel.text = [self.dateFormatter stringFromDate:self.datePicker.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
