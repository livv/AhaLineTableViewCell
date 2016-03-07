//
//  Common.h
//  AhaLineTableViewCell
//
//  Created by haiwei on 3/7/16.
//  Copyright © 2016 livv. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define UIColorFromHEX(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif /* Common_h */
