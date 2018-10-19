//
//  StudentInfo.h
//  Gradebook
//
//  Created by Zehra Abacioglu on 9/21/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** //my old code
@interface StudentInfo : NSObject{
    NSString *_student, *_address;
    float _midtermGrade, _finalGrade;
    int _hw1, _hw2, _hw3;
    UIImage *_image;
}
- (id) initWithName: (NSString *) student
            address: (NSString *) address
       midtermGrade: (float) midtermGrade
         finalGrade: (float) finalGrade
                hw1: (int) hw1
                hw2: (int) hw2
                hw3: (int) hw3
              image: (UIImage *) image;
 */

@interface StudentInfo : NSObject
@property(nonatomic) NSString *Student, *Address;
@property(nonatomic) float MidtermGrade, FinalGrade;
@property(nonatomic) int HW1, HW2, HW3;
@property(nonatomic) UIImage *Image;

//Getters
- (NSString *) getStudent;
- (NSString *) getAddress;
- (float) getMidtermGrade;
- (float) getFinalGrade;
- (int) getHW1;
- (int) getHW2;
- (int) getHW3;
- (UIImage *) getImage;

//Setters
- (void) setAddress: (NSString *) newAddress;
- (void) setMidtermGrade: (float) newMidtermGrade;
- (void) setFinalGrade: (float) newFinalGrade;
- (void) setHW1: (int) newHW1;
- (void) setHW2: (int) newHW2;
- (void) setHW3: (int) newHW3;
- (void) setImage: (UIImage *) newImage;

//main student function
-(void) setStudent: (NSString *) student
                  : (NSString *) address
                  : (float) midtermGrade
                  : (float) finalGrade
                  : (int) hw1
                  : (int) hw2
                  : (int) hw3
                  : (UIImage *) image;
//Other methods
//- (NSString *) PrintStudent;
//- (float) StudentAverage;

@end

NS_ASSUME_NONNULL_END
