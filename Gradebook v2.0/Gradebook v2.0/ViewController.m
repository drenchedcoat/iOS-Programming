//
//  ViewController.m
//  Gradebook v2.0
//
//  Created by Zehra Abacioglu on 10/12/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "StudentViewController.h"
#import "StudentInfo.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *StudentText;
@property (strong, nonatomic) IBOutlet UITextField *AddressText;
@property (strong, nonatomic) IBOutlet UITextField *MidtermText;
@property (strong, nonatomic) IBOutlet UITextField *FinalText;
@property (strong, nonatomic) IBOutlet UITextField *HW1Text;
@property (strong, nonatomic) IBOutlet UITextField *HW2Text;
@property (strong, nonatomic) IBOutlet UITextField *HW3Text;
@property (strong, nonatomic) IBOutlet UIButton *LeftButton;
@property (strong, nonatomic) IBOutlet UIButton *RightButton;
@property (strong, nonatomic) IBOutlet UIButton *AddNewStudentButton;
@property (strong, nonatomic) IBOutlet UISlider *ViewSlider; //extra credit
@property (weak, nonatomic) IBOutlet UISegmentedControl *ThreeSegment;
@property (strong, atomic) NSMutableArray *students;
@property (atomic) int counter; //array index for displaying current student
@end

@implementation ViewController

- (void)viewDidLoad {
    //create array where the student data is stored
    self.students = [[NSMutableArray alloc] init];
    self.counter = 0;
    
    //UI configurations
    [self.RightButton setTitleColor:[UIColor colorWithRed:27.0/255.0 green:173.0/255.0 blue:248.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.RightButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [self.LeftButton setTitleColor:[UIColor colorWithRed:27.0/255.0 green:173.0/255.0 blue:248.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.LeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [self.RightButton setEnabled:YES];
    [self.LeftButton setEnabled:NO];
    self.AddNewStudentButton.hidden = YES;
    [self.AddNewStudentButton setEnabled:NO];
    
    //"UpdateInfo" is default view when segued to this view controller
    self.ThreeSegment.selectedSegmentIndex = 0;
    
    //Load student data
    UIImage *image = [UIImage imageNamed:@"richard.jpg"];
    [self AddStudent: @"King Richard III" :@"Leicester Castle, England" : 72.0 : 45.0 : 9 : 10 : 00 : image];
    image = [UIImage imageNamed:@"younghamlet.jpg"];
    [self AddStudent: @"Prince Hamlet" :@"Elsinore Castle, Denmark" : 100.0 : 0.0 : 10 : 10 : 10 : image];
    image = [UIImage imageNamed:@"lear.jpg"];
    [self AddStudent: @"King Lear" :@"Leicester Castle, England" : 100.0 : 22.0 : 10 : 6 : 0 : image];
    image = [UIImage imageNamed:@"henry8.jpg"];
    [self AddStudent: @"King Henry VIII" :@"Whitehall Palace, England" : 62.0 : 60.0 : 7 : 6 : 7 : image];
    image = [UIImage imageNamed:@"elizabeth.jpg"];
    [self AddStudent: @"Queen Elizabeth" :@"Richmond Palace, England" : 90.0 : 100.0 : 9 : 10 : 10 : image];
    
    //display first student in view
    self.StudentText.text =[[self.students objectAtIndex:(self.counter)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter)] HW3]).stringValue;
}

//function adds student into array _students defined above
- (void) AddStudent: (NSString*) student
                   : (NSString*) address
                   : (float) midtermGrade
                   : (float) finalGrade
                   : (int) hw1
                   : (int) hw2
                   : (int) hw3
                   : (UIImage*) image{
    id myStudent = [[StudentInfo alloc] init];
    [myStudent setStudent
     : student
     : address
     : midtermGrade
     : finalGrade
     : hw1
     : hw2
     : hw3
     : image];
    [self.students addObject: myStudent];
}

//what is this for, check later
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (IBAction)SegmentClicked:(id)sender {
    NSInteger selectedSegment  = self.ThreeSegment.selectedSegmentIndex;

    if (selectedSegment == 0 && [self allowChangeView]) {
        self.LeftButton.hidden = NO;
        self.RightButton.hidden = NO;
        self.AddNewStudentButton.hidden = YES;
        self.view.backgroundColor = [UIColor whiteColor];
        
        [self.RightButton setEnabled:NO]; //set default at appearance
        [self.LeftButton setEnabled:YES]; //set default at appearance
        [self.AddNewStudentButton setEnabled:NO]; //my bad this shouldn't even be a button but I misread the assignment. I'm too lazy to change this to a textfield so it stays as a button
        
        //display students
        self.counter = (int)[self.students count]-1;
        self.StudentText.text =[[self.students objectAtIndex:(self.counter)] Student];
        self.AddressText.text = [[self.students objectAtIndex:(self.counter)] Address];
        self.MidtermText.text = @([[self.students objectAtIndex:(self.counter)] MidtermGrade]).stringValue;
        self.FinalText.text = @([[self.students objectAtIndex:(self.counter)] FinalGrade]).stringValue;
        self.HW1Text.text = @([[self.students objectAtIndex:(self.counter)] HW1]).stringValue;
        self.HW2Text.text = @([[self.students objectAtIndex:(self.counter)] HW2]).stringValue;
        self.HW3Text.text = @([[self.students objectAtIndex:(self.counter)] HW3]).stringValue;
    }
else if (selectedSegment == 1 && [self allowChangeView]){
        [self performSegueWithIdentifier:@"studentView" sender:self];
    }
    else if (selectedSegment == 2 && [self allowChangeView]) {
        _LeftButton.hidden = YES;
        _RightButton.hidden = YES;
        [self.AddNewStudentButton  setBackgroundColor:[UIColor greenColor]];
        _AddNewStudentButton.hidden = NO;
        self.view.backgroundColor = [UIColor yellowColor];
        self.AddNewStudentButton.titleLabel.text = @"Add New Student";
        
        //reset textfields to empty
        self.StudentText.text = @"";
        self.AddressText.text = @"";
        self.MidtermText.text = @"";
        self.FinalText.text = @"";
        self.HW1Text.text = @"";
        self.HW2Text.text = @"";
        self.HW3Text.text = @"";
    }
}

//to check if all data entered , if so allows segment change
- (bool) allowChangeView{
    if (self.StudentText.text.length > 0 &&
        self.AddressText.text.length > 0 &&
        self.MidtermText.text.length > 0 &&
        self.FinalText.text.length > 0 &&
        self.HW1Text.text.length > 0 &&
        self.HW2Text.text.length > 0 &&
        self.HW3Text.text.length > 0){
        //add condition if segment controller is clicked, add data to array
        //add student to array
        UIImage * image = [UIImage imageNamed:@"noimage.png"];
        [self AddStudent: self.StudentText.text
                        : self.AddressText.text
                        : [self.MidtermText.text floatValue]
                        : [self.FinalText.text floatValue]
                        : [self.HW1Text.text intValue]
                        : [self.HW2Text.text intValue]
                        : [self.HW3Text.text intValue]
                        : image];
        return true;
    }
    else {
        self.AddNewStudentButton.titleLabel.text = @"Cannot add!";
        return false;
    }
}
- (IBAction)studentNameChanged:(id)sender {
//    if(![_AddNewStudentButton isHidden]){
//        return;
//    }
//    ((StudentInfo *)self.students[_counter]).Student = _StudentText.text;
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).Student = _StudentText.text;
    }
    
}
- (IBAction)addressChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).Address = _AddressText.text;
    }
}
- (IBAction)midtermChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).MidtermGrade = [self.MidtermText.text floatValue];
    }
}
- (IBAction)finalChanged:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).FinalGrade = [self.FinalText.text floatValue];
    }
}
- (IBAction)hw1Changed:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).HW1 = [self.HW1Text.text intValue];
    }
}
- (IBAction)hw2Changed:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).HW2 = [self.HW2Text.text intValue];
    }
}
- (IBAction)hw3Changed:(id)sender {
    if([_AddNewStudentButton isHidden]){
        ((StudentInfo *)self.students[_counter]).HW3 = [self.HW3Text.text intValue];
    }
}

//what does this do? idk check
- (IBAction)textInputDone:(id)sender {
    [self.StudentText resignFirstResponder];
    [self.AddressText resignFirstResponder];
    [self.MidtermText resignFirstResponder];
    [self.FinalText resignFirstResponder];
    [self.HW1Text resignFirstResponder];
    [self.HW2Text resignFirstResponder];
    [self.HW3Text resignFirstResponder];
}

-(IBAction)unwindToViewController:(UIStoryboardSegue *)sender {
    //when redirected to this viewController, will default to first segment view
    self.ThreeSegment.selectedSegmentIndex = 0;
}

- (IBAction)LeftButtonClicked:(id)sender {
    //-1 in NSArray
    self.StudentText.text =[[self.students objectAtIndex:(self.counter-1)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter-1)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter-1)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter-1)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter-1)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter-1)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter-1)] HW3]).stringValue;
    self.counter = self.counter -1;
    if (self.counter ==0) {
        [self.LeftButton setEnabled:NO];
    }
    else {
        [self.LeftButton setEnabled:YES];
    }
    [self.RightButton setEnabled:YES];
}
- (IBAction)RightButtonClicked:(id)sender {
    //+1 in NSArray
    self.StudentText.text =[[self.students objectAtIndex:(self.counter+1)] Student];
    self.AddressText.text = [[self.students objectAtIndex:(self.counter+1)] Address];
    self.MidtermText.text = @([[self.students objectAtIndex:(self.counter+1)] MidtermGrade]).stringValue;
    self.FinalText.text = @([[self.students objectAtIndex:(self.counter+1)] FinalGrade]).stringValue;
    self.HW1Text.text = @([[self.students objectAtIndex:(self.counter+1)] HW1]).stringValue;
    self.HW2Text.text = @([[self.students objectAtIndex:(self.counter+1)] HW2]).stringValue;
    self.HW3Text.text = @([[self.students objectAtIndex:(self.counter+1)] HW3]).stringValue;
    //[self.image setImage: [[self.students objectAtIndex:(self.counter -1)] Image]]; //no image on this view
    self.counter = self.counter +1;
    if (self.counter == [self.students count]-1) {
        [self.RightButton setEnabled:NO];
    }
    else {
        [self.RightButton setEnabled:YES];
    }
    [self.LeftButton setEnabled:YES];
}
//adds student by enabling text input
//- (IBAction)StudentShouldReturn:(id)sender {
//    BOOL exists = NO;
//    int i;
//    //?
//    for (i = 0; i < [self.students count]; i++) {
//        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.StudentText.text]) {
//            self.AddressText.text = [[self.students objectAtIndex:i] Address];
//            self.MidtermText.text = @([[self.students objectAtIndex:i] MidtermGrade]).stringValue;
//            self.FinalText.text = @([[self.students objectAtIndex:i] FinalGrade]).stringValue;
//            self.HW1Text.text = @([[self.students objectAtIndex:i] HW1]).stringValue;
//            self.HW2Text.text = @([[self.students objectAtIndex:i] HW2]).stringValue;
//            self.HW3Text.text = @([[self.students objectAtIndex:i] HW3]).stringValue;
//            //[self.Image setImage: [[self.students objectAtIndex:i] Image]];
//            if (i == 0) {
//                [self.LeftButton setEnabled:NO];
//                [self.RightButton setEnabled:YES];
//            }
//            else if (i == [self.students count] -1) {
//                [self.RightButton setEnabled:NO];
//                [self.LeftButton setEnabled:YES];
//            }
//            else {
//                [self.RightButton setEnabled:YES];
//                [self.LeftButton setEnabled:YES];
//            }
//            self.counter = i;
//            exists = YES;
//            break;
//        }
//        if (exists == NO) {
//            [self.RightButton setEnabled:NO];
//            [self.LeftButton setEnabled:NO];
//            self.counter = -1;
//        }
//    }
//}
//adds student by enabling text input
- (IBAction)AddressShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.StudentText.text]) {
            [[self.students objectAtIndex:i] setAddress : self.AddressText.text];
            break;
        }
    }
}
//adds student by enabling text input
- (IBAction)MidtermShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.MidtermText.text]) {
            [[self.students objectAtIndex:i] setMidtermGrade: [self.MidtermText.text floatValue]];
            break;
        }
    }
}
//adds student by enabling text input
- (IBAction)FinalShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.FinalText.text]) {
            [[self.students objectAtIndex:i] setFinalGrade: [self.FinalText.text floatValue]];
            break;
        }
    }
}
//adds student by enabling text input
- (IBAction)HW1ShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.HW1Text.text]) {
            [[self.students objectAtIndex:i] setHW1: [self.HW1Text.text intValue]];
            break;
        }
    }
}
//adds student by enabling text input
- (IBAction)HW2ShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.HW2Text.text]) {
            [[self.students objectAtIndex:i] setHW2: [self.HW2Text.text intValue]];
            break;
        }
    }
}
//adds student by enabling text input
- (IBAction)HW3ShouldReturn:(id)sender {
    int i;
    for (i = 0; i < [self.students count]; i++) {
        if ([[[self.students objectAtIndex:i] Student] isEqualToString:self.HW3Text.text]) {
            [[self.students objectAtIndex:i] setHW3: [self.HW3Text.text intValue]];
            break;
        }
    }
}
//sends data to StudentViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"studentView"]){
        StudentViewController * controller = (StudentViewController *)segue.destinationViewController;
        controller.Student = [[self.students objectAtIndex:self.counter] Student];
        controller.Address = [[self.students objectAtIndex:self.counter] Address];
        controller.Image = [[self.students objectAtIndex:self.counter] Image];
    }
}

@end
