//
//  PickerViewViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/22/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "PickerViewViewController.h"
typedef NS_ENUM(NSInteger,LPickerViewControllerColorComponent) {
    LColorComponentRed = 0,
    LColorComponentGreen,
    LColorComponentBlue,
    LColorComponentCount
};
#define L_RGB_MAX 255.0
#define L_COLOR_VALUE_OFFSET 5
#define L_NUMBER_OF_COLOR_VALUES_PER_COMPONENT (NSInteger)ceil(L_RGB_MAX/L_COLOR_VALUE_OFFSET)
@interface PickerViewViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UIPickerViewAccessibilityDelegate>
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) UIView *colorSwatchView;
@property (nonatomic,assign) CGFloat redColorComponent;
@property (nonatomic,assign) CGFloat blueColorComponent;
@property (nonatomic,assign) CGFloat greenColorComponent;
@end

@implementation PickerViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(50, 100, 300, 200)];
//    [self.view addSubview:self.pickerView];
//    self.pickerView.showsSelectionIndicator = YES;
//    
//    self.colorSwatchView = [[UIView alloc]initWithFrame:CGRectMake(50, 330, 300, 200)];
//    [self.view addSubview:self.colorSwatchView];
//    [self configurePickerView];
}

- (void)updateColorSwitchViewBackgroundColor {
    self.colorSwatchView.backgroundColor = [UIColor colorWithRed:self.redColorComponent green:self.greenColorComponent blue:self.blueColorComponent alpha:1];
}

- (void)configurePickerView {
    
    [self selectRowInPickerView:13 withColorComponent:LColorComponentRed];
    [self selectRowInPickerView:12 withColorComponent:LColorComponentGreen];
    [self selectRowInPickerView:24 withColorComponent:LColorComponentBlue];
    
}

- (void)selectRowInPickerView:(NSInteger)row withColorComponent:(LPickerViewControllerColorComponent)colorComponent {
    
    [self.pickerView selectRow:row inComponent:(NSInteger)colorComponent animated:YES];
    [self pickerView:self.pickerView didSelectRow:row inComponent:(NSInteger)colorComponent];
}

#pragma mark - RGB Color Setter Overrides

- (void)setRedColorComponent:(CGFloat)redColorComponent {
    if (_redColorComponent != redColorComponent) {
        _redColorComponent = redColorComponent;
        [self updateColorSwitchViewBackgroundColor];
    }
}

-(void)setGreenColorComponent:(CGFloat)greenColorComponent{
    if (_greenColorComponent != greenColorComponent) {
        _greenColorComponent = greenColorComponent;
        [self updateColorSwitchViewBackgroundColor];
    }
}

-(void)setBlueColorComponent:(CGFloat)blueColorComponent {
    if (_blueColorComponent != blueColorComponent) {
        _blueColorComponent = blueColorComponent;
        [self updateColorSwitchViewBackgroundColor];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return LColorComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return L_NUMBER_OF_COLOR_VALUES_PER_COMPONENT;
}

#pragma mark - UIPickerViewDelegate 
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSInteger colorValue = row * L_COLOR_VALUE_OFFSET;
    
    CGFloat colorComponent = (CGFloat)colorValue / L_RGB_MAX;
    CGFloat redColorComponent = 0;
    CGFloat greenColorComponent = 0;
    CGFloat blueColorComponent = 0;
    
    switch (component) {
        case LColorComponentRed:
            redColorComponent = colorComponent;
            break;
        case LColorComponentGreen:
            greenColorComponent = colorComponent;
            break;
        case LColorComponentBlue:
            blueColorComponent = colorComponent;
            break;
        default:
            
            break;
    }
    
    UIColor *foregroundColor = [UIColor colorWithRed:redColorComponent green:greenColorComponent blue:blueColorComponent alpha:1];
    
    NSString *titleText = [NSString stringWithFormat:@"%ld", (long)colorValue];
    
    // Set the foreground color for the attributed string.
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: foregroundColor
                                 };
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:titleText attributes:attributes];
    
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    CGFloat colorComponentValue = (L_COLOR_VALUE_OFFSET * row) / L_RGB_MAX;
    
    switch (component) {
        case LColorComponentRed:
            self.redColorComponent = colorComponentValue;
            break;
        case LColorComponentGreen:
            self.greenColorComponent = colorComponentValue;
            break;
        case LColorComponentBlue:
            self.blueColorComponent = colorComponentValue;
            break;
        default:
            break;
    }
}

#pragma mark - UIPickerViewAccessibilityDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView accessibilityLabelForComponent:(NSInteger)component {
    NSString *accessibilityLabel;
    
    switch (component) {
        case LColorComponentRed:
            accessibilityLabel = NSLocalizedString(@"Red color component value", nil);
            break;
            
        case LColorComponentGreen:
            accessibilityLabel = NSLocalizedString(@"Green color component value", nil);
            break;
            
        case LColorComponentBlue:
            accessibilityLabel = NSLocalizedString(@"Blue color component value", nil);
            break;
            
        default:
            LLog(@"Invalid row/component combination for picker view.");
            break;
    }
    
    return accessibilityLabel;
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
