//
//  StudentInfo.m
//  Gradebook
//
//  Created by Zehra Abacioglu on 9/21/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "StudentInfo.h"
#import <UIKit/UIKit.h>

@implementation StudentInfo
@synthesize Student, Address, MidtermGrade, FinalGrade, HW1, HW2, HW3, Image;

//my old code
//- (id) initWithName: (NSString *) student
//            address: (NSString *) address
//       midtermGrade: (float) midtermGrade
//         finalGrade: (float) finalGrade
//                hw1: (int) hw1
//                hw2: (int) hw2
//                hw3: (int) hw3
//              image: (UIImage *) image {
//    if(self = [super init]) {
//        _student = student;
//        _address = address;
//        _midtermGrade = midtermGrade;
//        _finalGrade = finalGrade;
//        _hw1 = hw1;
//        _hw2 = hw2;
//        _hw3 = hw3;
//        self.image = image;
//    }
//    return self;
//}

//Getters
- (NSString *) getStudent {
    return Student;
}
- (NSString *) getAddress {
    return Address;
}
- (float) getMidtermGrade {
    return MidtermGrade;
}
- (float) getFinalGrade {
    return FinalGrade;
}
- (int) getHW1 {
    return HW1;
}
- (int) getHW2 {
    return HW2;
}
- (int) getHW3 {
    return HW3;
}
- (UIImage *) getImage {
    return Image;
}

//- (NSMutableArray *) getStudentInfo {
//    return self;
//}

//Setters
- (void) setAddress: (NSString *) newAddress {
    Address = newAddress;
}
- (void) setMidtermGrade: (float) newMidtermGrade {
    MidtermGrade = newMidtermGrade;
}
- (void) setFinalGrade: (float) newFinalGrade {
    FinalGrade = newFinalGrade;
}
- (void) setHW1: (int) newHW1 {
    HW1 = newHW1;
}
- (void) setHW2: (int) newHW2 {
    HW2 = newHW2;
}
- (void) setHW3: (int) newHW3 {
    HW3 = newHW3;
}
- (void) setImage: (UIImage *) newImage {
    Image = newImage;
}
//main setting function
-(void) setStudent: (NSString *) student
                  : (NSString *) address
                  : (float) midtermGrade
                  : (float) finalGrade
                  : (int) hw1
                  : (int) hw2
                  : (int) hw3
                  : (UIImage *) image{
    self.Student = student;
    self.Address = address;
    self.MidtermGrade = midtermGrade;
    self.FinalGrade = finalGrade;
    self.HW1 = hw1;
    self.HW2 = hw2;
    self.HW3 = hw3;
    self.Image = image;
}


//Other methods
//- (NSString *) PrintStudent {
//    NSString *output = [NSString stringWithFormat:@"Address: %@, Midterm: %f, Final: %f, Homework 1: %d, Homework 2: %d, Homework 3: %d", Address, MidtermGrade, FinalGrade, HW1, HW2, HW3];
//    return output;
//}
//- (float) StudentAverage {
//    //30% Midterm, 40% Final and 30% Homework
//    int total = [self getMidtermGrade] * 0.3 + [self getFinalGrade] * 0.4
//    + (float)[self getHW1] + (float)[self getHW2] + (float)[self getHW3];
//    return total;
//}


@end
