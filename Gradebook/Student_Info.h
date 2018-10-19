//
//  Student_Info.h
//  Gradebook
//
//  Created by Zehra Abacioglu on 9/21/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student_Info : NSObject{
    NSString *_name, *_address;
    float _midtermGrade, _finalGrade;
    int _hw1, _hw2, _hw3;
}

- (id) initWithName: (NSString *) name address: (NSString *) address;

//Getters
- (NSString *) getName;
- (NSString *) getAddress;
- (float) getMidtermGrade;
- (float) getFinalGrade;
- (int) getHW1;
- (int) getHW2;
- (int) getHW3;

//Setters
- (void) setAddress: (NSString *) newAddress;
- (void) setMidtermGrade: (float) newMidtermGrade;
- (void) setFinalGrade: (float) newFinalGrade;
- (void) setHW1: (int) newHW1;
- (void) setHW2: (int) newHW2;
- (void) setHW3: (int) newHW3;

//Other methods
- (NSString *) Print_Student;
- (float) Student_Average;

@end

NS_ASSUME_NONNULL_END
