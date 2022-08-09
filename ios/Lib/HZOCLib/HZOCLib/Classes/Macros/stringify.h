//
//  stringify.h
//  GWGO-Native
//
//  Created by Tedzhou on 7/29/16.
//  Copyright © 2016 4c. All rights reserved.
//

#ifndef stringify_h
#define stringify_h

/*
 宏字符串操作，避免在宏里面嵌套使用宏带来的问题,
 因为宏中遇到#或##时就不会再展开宏中嵌套的宏了
 */
#define stringify(STR) stringify_(STR)
#define stringify_(STR) # STR
#define string_concat(A, B) string_concat_(A, B)
#define string_concat_(A, B) A ## B

#define constStr(N) [@(N) stringValue]

#endif /* stringify_h */
