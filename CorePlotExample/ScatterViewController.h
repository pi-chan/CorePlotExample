//
//  ScatterViewController.h
//  CorePlotExample
//
//  Created by Hiromasa OHNO on 2013/12/27.
//  Copyright (c) 2013年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CorePlot/CorePlot-CocoaTouch.h>
#import <vector>

@interface ScatterViewController : UIViewController<CPTPlotDataSource>
{
    std::vector<int> _dataA;
    std::vector<int> _dataB;
}

@end
