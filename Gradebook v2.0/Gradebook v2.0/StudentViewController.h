//
//  StudentViewController.h
//  Gradebook v2.0
//
//  Created by Zehra Abacioglu on 10/12/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StudentViewControllerDelegate;
@interface StudentViewController : UIViewController
@property (weak, nonatomic) id<StudentViewControllerDelegate> delegate;

@property(nonatomic, assign) NSString *Student, *Address;
@property(nonatomic, assign) UIImage *Image;

@property (strong, nonatomic) IBOutlet UIImageView *ImageBox;

//idk what i'm doing below
//@property (strong, atomic) ViewController *VCindex;

@end

@protocol StudentViewControllerDelegate <NSObject>

- (void)StudentViewControllerDidCancel: (StudentViewController *) studentVC;
- (void) StudentViewController:(StudentViewController *)studentVC
                       Student: (NSString *) student
                       Address: (NSString *) address
                  //MidtermGrade: (float) midtermGrade
                    //FinalGrade: (float) finalGrade
                           //HW1: (int) hw1
                           //HW2: (int) hw2
                           //HW3: (int) hw3
                         Image: (UIImage *) image;
@end

NS_ASSUME_NONNULL_END
