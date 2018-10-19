//
//  main.m
//  Gradebook
//
//  Created by Zehra Abacioglu on 9/19/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student_Info.h"

NSMutableDictionary *course;

//adds student to course dictionary
Boolean Add_Student(NSString* name, NSString* address) {
    
    if(course == nil) {
        course = [[NSMutableDictionary alloc] init];
    }
    
    Student_Info *newStudent = [[Student_Info alloc] initWithName:name address:address];
    
    if([[course allKeys] containsObject: name]) {
        NSLog(@"Key already exists. Failed to add new student: %@", name);
        return false;
    } else {
        course[name] = newStudent;
    }
    return true;
}

Boolean Remove_Student(NSString * name) {
    if(course == nil) {
        NSLog(@"There are no students in the course.");
        return false;
    }
    if(![[course allKeys] containsObject: name]) {
        NSLog(@"Student %@ does not exist in this course.", name);
        return false;
    }
    [course removeObjectForKey:name];
    NSLog(@"Removed student: %@", name);
    return true;
    
}

//updates student midterm/final grade
Boolean Update_Test(NSString * name, float grade, NSString * testType) {
    
    if(course == nil) {
        NSLog(@"Please add students to the course first!");
        return false;
    }
    
    if (![[course allKeys] containsObject:name]) {
        NSLog(@"%@ is not in the course!", name);
        return false;
    }
    
    //insert methods for updating test grade
    if( [testType caseInsensitiveCompare:@"midterm"] == NSOrderedSame) {
        [[course objectForKey:name] setMidtermGrade: grade];
    } else if( [testType caseInsensitiveCompare:@"final"] == NSOrderedSame) {
        [[course objectForKey:name] setFinalGrade: grade];
    }
    NSLog(@"Test grade updated for %@.", name);
    
    return true;
}

//Updates student hw grade
Boolean Update_HW(NSString * name, float grade, NSString * scoreType) {
    if(course == nil) {
        NSLog(@"Please add students to the course first!");
        return false;
    }
    if (![[course allKeys] containsObject:name]) {
        NSLog(@"%@ is not in the course!", name);
        return false;
    }
    if( [scoreType caseInsensitiveCompare:@"hw1"] == NSOrderedSame) {
        [[course objectForKey:name] setHW1: grade];
    } else if( [scoreType caseInsensitiveCompare:@"hw2"] == NSOrderedSame) {
        [[course objectForKey:name] setHW2: grade];
    } else if( [scoreType caseInsensitiveCompare:@"hw3"] == NSOrderedSame) {
        [[course objectForKey:name] setHW3: grade];
    }
    NSLog(@"HW grade updated for %@.", name);
    return true;
}

void Print_Dictionary() {
    if(course != nil) {
        for(id name in course) {
            id text = [course objectForKey:name];
            NSLog(@"Name: %@, %@", name, [text Print_Student]);
        }
    }
}

void Print_Average() {
    
    if(course == nil) {
        NSLog(@"Please add students to the course first!");
        return;
    }
    float total = 0;
    int size = 0;
    for(id name in course) {
        id student = [course objectForKey:name];
        total += ([student Student_Average]);
        size++;
    }
    total = total / (float)size;
    NSLog(@"Class average: %f", total);
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Add_Student(@"Joan Watson", @"New York");
        Add_Student(@"Nancy Drew", @"River Heights");
        Add_Student(@"Jessica Fletcher", @"Cabot Cove");
        Add_Student(@"Nora Charles", @"New York");
        Add_Student(@"Miss Marple", @"St. Mary Mead");
        
        Update_Test(@"Joan Watson", 99.0, @"midterm");
        Update_Test(@"Joan Watson", 100.0, @"final");
        Update_HW(@"Joan Watson", 10, @"hw1");
        Update_HW(@"Joan Watson", 10, @"hw2");
        Update_HW(@"Joan Watson", 10, @"hw3");
        
        Update_Test(@"Nancy Drew", 85.5, @"midterm");
        Update_Test(@"Nancy Drew", 80.5, @"final");
        Update_HW(@"Nancy Drew", 0, @"hw1");
        Update_HW(@"Nancy Drew", 0, @"hw2");
        Update_HW(@"Nancy Drew", 10, @"hw3");
        
        Update_Test(@"Jessica Fletcher", 88.0, @"midterm");
        Update_Test(@"Jessica Fletcher", 90.5, @"final");
        Update_HW(@"Jessica Fletcher", 8, @"hw1");
        Update_HW(@"Jessica Fletcher", 8, @"hw2");
        Update_HW(@"Jessica Fletcher", 10, @"hw3");
        
        Update_Test(@"Nora Charles", 79.9, @"midterm");
        Update_Test(@"Nora Charles", 79.0, @"final");
        Update_HW(@"Nora Charles", 2, @"hw1");
        Update_HW(@"Nora Charles", 5, @"hw2");
        Update_HW(@"Nora Charles", 10, @"hw3");
        
        Update_Test(@"Miss Marple", 99.0, @"midterm");
        Update_Test(@"Miss Marple",90.0, @"final");
        Update_HW(@"Miss Marple", 0, @"hw1");
        Update_HW(@"Miss Marple", 10, @"hw2");
        Update_HW(@"Miss Marple", 10, @"hw3");
        
        Print_Dictionary();
        
        Remove_Student(@"Jessica Fletcher");
        Remove_Student(@"Miss Marple");
        
        Print_Dictionary();
        
        Add_Student(@"Katy Pierce", @"New York");
        Add_Student(@"Sam Lu", @"River Heights");
        
        Update_Test(@"Katy Pierce", 80.5, @"midterm");
        Update_Test(@"Katy Pierce", 65.0, @"final");
        Update_HW(@"Katy Pierce", 5, @"hw1");
        Update_HW(@"Katy Pierce", 8, @"hw2");
        Update_HW(@"Katy Pierce", 9, @"hw3");
        
        Update_Test(@"Sam Lu", 70.0, @"midterm");
        Update_Test(@"Sam Lu",99.5, @"final");
        Update_HW(@"Sam Lu", 9, @"hw1");
        Update_HW(@"Sam Lu", 6, @"hw2");
        Update_HW(@"Sam Lu", 7, @"hw3");
        
        Print_Dictionary();
        
        Print_Average();
    }
    return 0;
}
