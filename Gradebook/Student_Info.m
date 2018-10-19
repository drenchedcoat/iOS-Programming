//
//  Student_Info.m
//  Gradebook
//
//  Created by Zehra Abacioglu on 9/21/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "Student_Info.h"

@implementation Student_Info

- (id) initWithName: (NSString *) name address: (NSString *) address {
    if(self = [super init]) {
        _name = name;
        _address = address;

        _midtermGrade = ((float)rand() / RAND_MAX) * 100;
        _finalGrade = ((float)rand() / RAND_MAX) * 100;
        _hw1 = arc4random_uniform(10);
        _hw2 = arc4random_uniform(10);
        _hw3 = arc4random_uniform(10);
    }
    return self;
}

//Getters
- (NSString *) getName {
    return _name;
}
- (NSString *) getAddress {
    return _address;
}
- (float) getMidtermGrade {
    return _midtermGrade;
}
- (float) getFinalGrade {
    return _finalGrade;
}
- (int) getHW1 {
    return _hw1;
}
- (int) getHW2 {
    return _hw2;
}
- (int) getHW3 {
    return _hw3;
}

//Setters
- (void) setAddress: (NSString *) newAddress {
    _address = newAddress;
}
- (void) setMidtermGrade: (float) newMidtermGrade {
    _midtermGrade = newMidtermGrade;
}
- (void) setFinalGrade: (float) newFinalGrade {
    _finalGrade = newFinalGrade;
}
- (void) setHW1: (int) newHW1 {
    _hw1 = newHW1;
}
- (void) setHW2: (int) newHW2 {
    _hw2 = newHW2;
}
- (void) setHW3: (int) newHW3 {
    _hw3 = newHW3;
}

//Other methods
- (NSString *) Print_Student {
    NSString *output = [NSString stringWithFormat:@"Address: %@, Midterm: %f, Final: %f, Homework 1: %d, Homework 2: %d, Homework 3: %d", _address, _midtermGrade, _finalGrade, _hw1, _hw2, _hw3];
    return output;
}

- (float) Student_Average {
    //30% Midterm, 40% Final and 30% Homework
    int total = [self getMidtermGrade] * 0.3 + [self getFinalGrade] * 0.4
    + (float)[self getHW1] + (float)[self getHW2] + (float)[self getHW3];
    return total;
}

@end
