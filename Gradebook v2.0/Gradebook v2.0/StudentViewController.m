//
//  StudentViewController.m
//  Gradebook v2.0
//
//  Created by Zehra Abacioglu on 10/12/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "StudentViewController.h"
//#import "StudentInfo.h"

@interface StudentViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Back;
//@property (strong, nonatomic) IBOutlet UIImageView *ImageBox; //in .h file
@property (strong, nonatomic) IBOutlet UITextField *StudentText;
@property (strong, nonatomic) IBOutlet UITextField *AddressText;
@property (atomic) int counter;
@end

@implementation StudentViewController

- (void)viewDidLoad {
    [self.Back setTitleColor:[UIColor colorWithRed:27.0/255.0 green:173.0/255.0 blue:248.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.Back setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [self.Back setEnabled:YES];
    [super viewDidLoad];
    //display first student in view
    self.StudentText.text =self.Student;
    self.AddressText.text = self.Address;
    
    //self.ImageBox = [[UIImageView alloc] init];
    //UIImage * noimage = [UIImage imageNamed:@"noimage.png"];
    //self.ImageBox.image = noimage;
    //[self.UIImage addSubview:self.UIImage];
    
    //UIImage * noimage = //UIImage na self.Image;
    self.ImageBox.image = self.Image;
    
    //idk what im doing below
    //self.VCindex = [[UIViewController alloc]init];
    
    [self.delegate StudentViewController: self
                             Student: self.StudentText.text
                             Address: self.AddressText.text
                                    Image: self.ImageBox.image];
}

- (IBAction)backClicked:(UIButton *)sender {
    [self.delegate StudentViewControllerDidCancel:self];
}

@end
